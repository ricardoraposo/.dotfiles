import type { ExtensionAPI, ExtensionCommandContext } from "@earendil-works/pi-coding-agent";
import type { AutocompleteItem } from "@earendil-works/pi-tui";
import { readFile, readdir, stat } from "node:fs/promises";
import { isAbsolute, join, resolve, dirname, basename, relative } from "node:path";

type ParsedRef = {
	path: string;
	startLine?: number;
	endLine?: number;
};

const LANG_BY_EXT: Record<string, string> = {
	ts: "ts",
	tsx: "tsx",
	js: "js",
	jsx: "jsx",
	mjs: "js",
	cjs: "js",
	ex: "elixir",
	exs: "elixir",
	py: "python",
	rb: "ruby",
	go: "go",
	rs: "rust",
	java: "java",
	kt: "kotlin",
	swift: "swift",
	c: "c",
	h: "c",
	cpp: "cpp",
	cc: "cpp",
	hpp: "cpp",
	cs: "csharp",
	php: "php",
	sql: "sql",
	sh: "bash",
	bash: "bash",
	zsh: "bash",
	yaml: "yaml",
	yml: "yaml",
	json: "json",
	html: "html",
	css: "css",
	scss: "scss",
	md: "markdown",
	svelte: "svelte",
	vue: "vue",
};

function languageForPath(filePath: string): string {
	const ext = filePath.split(".").pop()?.toLowerCase() ?? "";
	return LANG_BY_EXT[ext] ?? "";
}

function parseRef(rawArg: string): ParsedRef | { error: string } {
	const arg = rawArg.trim().replace(/^@/, "");
	if (!arg) {
		return { error: "Usage: /ref <path>[:start[-end]]  (e.g. /ref src/foo.ts:42-67)" };
	}

	const rangeMatch = arg.match(/^(.*?):(\d+)(?:-(\d+))?$/);
	if (rangeMatch) {
		const [, path, startStr, endStr] = rangeMatch;
		const startLine = Number.parseInt(startStr, 10);
		const endLine = endStr ? Number.parseInt(endStr, 10) : startLine;
		if (endLine < startLine) {
			return { error: `Invalid range: ${startLine}-${endLine} (end before start)` };
		}
		return { path, startLine, endLine };
	}

	return { path: arg };
}

async function buildReferenceBlock(
	ctx: ExtensionCommandContext,
	parsed: ParsedRef,
): Promise<{ block: string; label: string } | { error: string }> {
	const absolutePath = isAbsolute(parsed.path) ? parsed.path : resolve(ctx.cwd, parsed.path);

	let raw: string;
	try {
		raw = await readFile(absolutePath, "utf8");
	} catch {
		return { error: `Cannot read file: ${parsed.path}` };
	}

	const allLines = raw.split("\n");
	const totalLines = allLines.length;

	let startLine = parsed.startLine ?? 1;
	let endLine = parsed.endLine ?? totalLines;

	startLine = Math.max(1, Math.min(startLine, totalLines));
	endLine = Math.max(startLine, Math.min(endLine, totalLines));

	const selectedLines = allLines.slice(startLine - 1, endLine);
	const padWidth = String(endLine).length;
	const numbered = selectedLines
		.map((line, index) => `${String(startLine + index).padStart(padWidth, " ")}  ${line}`)
		.join("\n");

	const displayPath = relative(ctx.cwd, absolutePath) || parsed.path;
	const rangeSuffix =
		parsed.startLine !== undefined ? `:${startLine}-${endLine}` : ` (full file, ${totalLines} lines)`;
	const citation = `${displayPath}${parsed.startLine !== undefined ? `:${startLine}-${endLine}` : ""}`;
	const lang = languageForPath(absolutePath);

	const block = [
		"The user is referencing a specific region of code. Answer questions about it using this exact location:",
		"",
		`Referenced: ${citation}`,
		"",
		"```" + lang,
		numbered,
		"```",
	].join("\n");

	return { block, label: `${displayPath}${rangeSuffix}` };
}

async function completePath(cwd: string, prefix: string): Promise<AutocompleteItem[] | null> {
	const cleaned = prefix.replace(/^@/, "");
	const colonIndex = cleaned.indexOf(":");
	if (colonIndex !== -1) {
		return null;
	}

	const hasTrailingSlash = cleaned.endsWith("/");
	const dirPart = hasTrailingSlash ? cleaned : dirname(cleaned);
	const namePart = hasTrailingSlash ? "" : basename(cleaned);
	const searchDir = resolve(cwd, dirPart || ".");

	let entries: string[];
	try {
		entries = await readdir(searchDir);
	} catch {
		return null;
	}

	const matches: AutocompleteItem[] = [];
	for (const entry of entries) {
		if (entry.startsWith(".") && !namePart.startsWith(".")) continue;
		if (entry === "node_modules" || entry === ".git") continue;
		if (namePart && !entry.toLowerCase().startsWith(namePart.toLowerCase())) continue;

		let isDir = false;
		try {
			isDir = (await stat(join(searchDir, entry))).isDirectory();
		} catch {
			continue;
		}

		const relPrefix = dirPart && dirPart !== "." ? `${dirPart.replace(/\/$/, "")}/` : "";
		const value = `${relPrefix}${entry}${isDir ? "/" : ""}`;
		matches.push({
			value,
			label: `${entry}${isDir ? "/" : ""}`,
			description: isDir ? "directory" : "file",
		});

		if (matches.length >= 30) break;
	}

	return matches.length > 0 ? matches : null;
}

export default function (pi: ExtensionAPI): void {
	pi.registerCommand("ref", {
		description: "Reference a file or line range and inject it into the prompt (e.g. /ref src/foo.ts:42-67)",
		handler: async (args, ctx) => {
			const trimmed = args.trim();
			if (!trimmed) {
				ctx.ui.notify("Usage: /ref <path>[:start[-end]] [question]", "warning");
				return;
			}

			const firstSpace = trimmed.search(/\s/);
			const refToken = firstSpace === -1 ? trimmed : trimmed.slice(0, firstSpace);
			const question = firstSpace === -1 ? "" : trimmed.slice(firstSpace + 1).trim();

			const parsed = parseRef(refToken);
			if ("error" in parsed) {
				ctx.ui.notify(parsed.error, "warning");
				return;
			}

			const result = await buildReferenceBlock(ctx, parsed);
			if ("error" in result) {
				ctx.ui.notify(result.error, "error");
				return;
			}

			if (question) {
				if (!ctx.isIdle()) {
					ctx.ui.notify("Agent is busy — try again when idle", "warning");
					return;
				}
				pi.sendUserMessage(`${result.block}\n\n${question}`);
				ctx.ui.notify(`Asked about ${result.label}`, "info");
				return;
			}

			pi.sendMessage(
				{
					customType: "ref-code",
					content: result.block,
					display: true,
				},
				{ deliverAs: "nextTurn" },
			);

			ctx.ui.setEditorText(`Referenced ${result.label}. `);
			ctx.ui.notify(`Pinned ${result.label} for your next message`, "info");
		},
	});

	pi.on("session_start", async (_event, ctx) => {
		ctx.ui.addAutocompleteProvider((current) => ({
			async getSuggestions(lines, cursorLine, cursorCol, options) {
				const currentLine = lines[cursorLine] ?? "";
				const textBeforeCursor = currentLine.slice(0, cursorCol);
				const match = textBeforeCursor.match(/^\/ref\s+(\S*)$/);
				if (!match) {
					return current.getSuggestions(lines, cursorLine, cursorCol, options);
				}

				const token = match[1];
				const items = await completePath(ctx.cwd, token);
				if (options.signal.aborted || !items) {
					return current.getSuggestions(lines, cursorLine, cursorCol, options);
				}

				return { items, prefix: token };
			},
			applyCompletion(lines, cursorLine, cursorCol, item, prefix) {
				return current.applyCompletion(lines, cursorLine, cursorCol, item, prefix);
			},
			shouldTriggerFileCompletion(lines, cursorLine, cursorCol) {
				return current.shouldTriggerFileCompletion?.(lines, cursorLine, cursorCol) ?? true;
			},
		}));
	});
}

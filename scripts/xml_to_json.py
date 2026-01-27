#!/usr/bin/env python3
"""
Simple XML to JSON converter script.
Usage:
  - From stdin: echo '<root><item>test</item></root>' | python xml_to_json.py
  - From file: python xml_to_json.py input.xml output.json
  - In Vim: Select XML text and run :'<,'>!python xml_to_json.py
"""

import json
import sys
import xml.etree.ElementTree as ET


def xml_to_dict(element):
    """
    Recursively convert an XML element to a dictionary.
    """
    result = {}

    # Add attributes if present
    if element.attrib:
        result["@attributes"] = element.attrib

    # Process child elements
    children = list(element)
    if children:
        child_dict = {}
        for child in children:
            child_data = xml_to_dict(child)

            # Handle multiple children with same tag
            if child.tag in child_dict:
                if not isinstance(child_dict[child.tag], list):
                    child_dict[child.tag] = [child_dict[child.tag]]
                child_dict[child.tag].append(child_data)
            else:
                child_dict[child.tag] = child_data

        result.update(child_dict)

    # Add text content if present
    if element.text and element.text.strip():
        if result:
            result["#text"] = element.text.strip()
        else:
            return element.text.strip()

    return result if result else None


def convert_xml_string_to_json(xml_string):
    """
    Convert XML string to JSON string.
    """
    try:
        # Parse XML string
        root = ET.fromstring(xml_string)

        # Convert to dictionary
        data = {root.tag: xml_to_dict(root)}

        # Return JSON string
        return json.dumps(data, indent=2, ensure_ascii=False)

    except ET.ParseError as e:
        print(f"Error parsing XML: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


def convert_xml_file_to_json(xml_file, json_file):
    """
    Convert XML file to JSON file.
    """
    try:
        # Parse XML file
        tree = ET.parse(xml_file)
        root = tree.getroot()

        # Convert to dictionary
        data = {root.tag: xml_to_dict(root)}

        # Write to JSON file
        with open(json_file, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        print(f"Successfully converted {xml_file} to {json_file}", file=sys.stderr)
        return True

    except FileNotFoundError:
        print(f"Error: File '{xml_file}' not found", file=sys.stderr)
        return False
    except ET.ParseError as e:
        print(f"Error parsing XML: {e}", file=sys.stderr)
        return False
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return False


def main():
    # Check if reading from stdin (pipe or Vim filter)
    if not sys.stdin.isatty():
        # Read XML from stdin
        xml_input = sys.stdin.read()
        json_output = convert_xml_string_to_json(xml_input)
        print(json_output)
    elif len(sys.argv) == 3:
        # File mode
        xml_file = sys.argv[1]
        json_file = sys.argv[2]

        if convert_xml_file_to_json(xml_file, json_file):
            sys.exit(0)
        else:
            sys.exit(1)
    else:
        print("Usage:", file=sys.stderr)
        print(
            "  From stdin: echo '<root>...</root>' | python xml_to_json.py",
            file=sys.stderr,
        )
        print(
            "  From file:  python xml_to_json.py input.xml output.json", file=sys.stderr
        )
        print(
            "  In Vim:     Select XML and run :'<,'>!python xml_to_json.py",
            file=sys.stderr,
        )
        sys.exit(1)


if __name__ == "__main__":
    main()

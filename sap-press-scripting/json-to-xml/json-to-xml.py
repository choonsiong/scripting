import json

fmt = "    <employee no='%s' birth_date='%s'>%s %s</employee>\n"

# Open the source and target files
with open('employee.json', 'r') as jsonfile, open('employee.xml', 'w') as xmlfile:
    # Read the json file and turns it into a list of dictionaries where each
    # entry is a dictionary with employee data
    data = json.load(jsonfile)
    xmlfile.write('<?xml version="1.0"?>\n<employees>\n')
    # Loop through all list elements
    for item in data:
        xmlfile.write(fmt % (item['emp_no'], item['birth_date'], item['first_name'], item['last_name']))
    xmlfile.write('</employees>\n')
import os
import re
import json


# # =====================================
# # INPUT / OUTPUT
# # =====================================

# PROJECT_PATH = r"F:\Main Project\petclinic-microservices"

# OUTPUT_FILE = "generated_api.json"

# =====================================
# INPUT / OUTPUT
# =====================================

PROJECT_PATH = r"F:\Main Project\spring-petclinic-microservices-main"

OUTPUT_FILE = "existing_api.json"

api_list = []


# =====================================
# Extract annotation value
# =====================================

def extract_value(text):

    if not text:
        return ""

    # value="/abc" or path="/abc"

    m = re.search(
        r'(value|path)\s*=\s*"([^"]+)"',
        text
    )

    if m:
        return m.group(2)


    # "/abc"

    m = re.search(
        r'"([^"]*)"',
        text
    )

    if m:
        return m.group(1)


    return ""



def clean_path(path):

    if not path:
        return "/"

    path = path.replace("//","/")

    if not path.startswith("/"):
        path="/"+path

    if len(path)>1 and path.endswith("/"):
        path=path[:-1]

    return path



# =====================================
# Scan Project
# =====================================

for root, dirs, files in os.walk(PROJECT_PATH):

    for file in files:

        if not file.endswith(".java"):
            continue


        file_path=os.path.join(root,file)


        with open(
            file_path,
            "r",
            encoding="utf-8",
            errors="ignore"
        ) as f:

            code=f.read()


        # REST Controller only

        if "@RestController" not in code:
            continue


        class_name=file.replace(".java","")


        # service name

        relative=os.path.relpath(
            file_path,
            PROJECT_PATH
        )

        service=relative.split(os.sep)[0]



        # class level @RequestMapping

        base_path=""


        class_map=re.search(
            r'@RequestMapping\s*(?:\((.*?)\))?',
            code,
            re.S
        )


        if class_map:

            base_path=extract_value(
                class_map.group(1)
            )



        mappings={

            "GET":"GetMapping",

            "POST":"PostMapping",

            "PUT":"PutMapping",

            "DELETE":"DeleteMapping",

            "PATCH":"PatchMapping"

        }



        for method, annotation in mappings.items():


            pattern=(
                r'@'
                +annotation+
                r'\s*(?:\((.*?)\))?'
            )


            matches=re.finditer(
                pattern,
                code,
                re.S
            )


            for match in matches:


                endpoint=extract_value(
                    match.group(1)
                )


                if endpoint:

                    final_path=(
                        base_path+
                        "/"+
                        endpoint
                    )

                else:

                    final_path=base_path



                api={

                    "method":method,

                    "path":clean_path(final_path),

                    "class":class_name,

                    "service":service,

                    "file":file_path

                }


                if api not in api_list:

                    api_list.append(api)



# =====================================
# Save
# =====================================


with open(
    OUTPUT_FILE,
    "w"
) as f:

    json.dump(
        api_list,
        f,
        indent=4
    )



print("==============================")
print("Generated API Extraction Done")
print("==============================")

print("Total APIs:",len(api_list))

print("Saved:",OUTPUT_FILE)
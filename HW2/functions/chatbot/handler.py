import datetime
import re
import requests

def get_substring_between_quotes(input_string):
    # Define a regular expression pattern to match substrings between quotes
    pattern = r'"(.*?)"'
    
    # Use re.findall to find all occurrences of the pattern in the input string
    matches = re.findall(pattern, input_string)
    
    # Return the matched substrings
    return matches

def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """
    # Ask name
    if "name" in req:
        return "My name is Qizhe's Chatbot."
    # Ask time
    elif "time" in req:
        now = datetime.datetime.now()
        return f"The current date and time is {now.strftime('%Y-%m-%d %H:%M:%S')}."
    # Ask to call figlet
    elif "figlet" in req and (quoted_strs := get_substring_between_quotes(req)):
        figlet_str = quoted_strs[0]
        return requests.get(f"http://gateway:8080/function/figlet", data=figlet_str).text
    # Anything that doesn't match the above
    else:
         return "Sorry, I don't understand that."

When I pressed the “Crash Demo” button, the application crashed with the error:
“Null check operator used on a null value.”
The stack trace pointed to lib/main.dart at the line where the code used name!.

Why it crashed:
The variable name was declared as nullable (String? name) and had the value null, but the code forced it to be non-null using the null check operator !. Calling a method on null caused the crash.
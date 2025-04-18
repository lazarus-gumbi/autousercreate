
# Auto User Create Script (`autousercreate.sh`)

This Bash script automates the creation of user accounts on a Linux system based on information provided in a CSV file. It simplifies the process of provisioning multiple users, especially in scenarios requiring a standardized setup, enforced password changes upon first login, and setting an account expiration date.

## Features

* **Automated User Provisioning:** Creates multiple user accounts from a CSV file.
* **CSV-Driven Input:** Reads user details from a CSV file where each line represents a user.
* **Username Parsing:** Extracts first and last names from a hyphen-separated username format (e.g., `john-doe`).
* **Administrative User Creation:** Automatically adds users specified with the "admins" group in the CSV to the `sudo` group for administrative privileges.
* **Standard User Creation:** Creates standard user accounts for other group designations (currently, specific non-admin group assignment might require further implementation).
* **Forced Password Change on First Login:** Ensures security by forcing each new user to set their own password upon their initial login using `chage -d 0`.
* **Account Expiration:** Reads an expiration date from the CSV and sets it for the newly created user using the `-e` flag with `useradd`.
* **Basic Input Validation:** Checks for the presence and existence of the provided CSV file.
* **Informative Output:** Provides feedback on the terminal about the users being processed and whether they were created successfully, including their expiration date and admin status.

## Usage

1.  **Clone the repository (if applicable) or download the `autousercreate.sh` script.**
2.  **Make the script executable:**
    ```bash
    chmod +x autousercreate.sh
    ```
3.  **Prepare your CSV file:** Create a CSV file (e.g., `users.csv`) with the following format for each user on a new line:
    ```csv
    firstname-lastname,expiration_date,group
    ```
    * `firstname-lastname`: The desired username, with the first and last name separated by a hyphen.
    * `expdate`: The date when the user account should expire, in `YYYY-MM-DD` format (e.g., `2025-12-31`).
    * `group`: The group affiliation for the user. Use `admins` for administrative users (who will be added to the `sudo` group). Other group names can be used for standard users (note: specific non-admin group assignment might need further implementation in the script).

    **Example `users.csv`:**
    ```csv
    john-doe,2026-01-15,admins
    jane-smith,2025-11-30,staff
    peter-jones,2026-05-20,developers
    ```

4.  **Run the script, providing the CSV file as an argument:**
    ```bash
    ./autousercreate.sh users.csv
    ```

    You will need `sudo` privileges to run this script as it creates and modifies user accounts.

## Potential Improvements (Future Enhancements)

* **Robust CSV Parsing:** Implement more robust parsing to handle various CSV formats and potential issues.
* **Comprehensive Error Handling and Logging:** Add detailed error checking and logging to a file for better tracking and troubleshooting, including validation of the expiration date format.
* **Configuration Options:** Allow customization of the administrative group name and other settings through configuration files or environment variables.
* **Idempotency Checks:** Implement checks to see if a user already exists before attempting to create them.
* **Dynamic Group Assignment:** Fully implement the assignment of users to specific non-admin groups based on the CSV data.
* **Expiration Date Validation:** Add validation to ensure the `expiration_date` field in the CSV is in the correct `YYYY-MM-DD` format.

## Author

\[Your Name/GitHub Username]

## License

\[Your License (e.g., MIT License, Apache 2.0)]
```

# Keyspace Deletion Script

This is a Bash script that allows you to list and delete Cassandra keyspaces that match a given prefix. It provides the option to either actually delete the keyspaces or just list and count them without performing any deletions.

## Usage

To use the script, execute it from the command line with the necessary arguments:

```bash
./drop_keyspaces.sh -u <username> -p <password> -prefix <keyspace_prefix> [-d|--delete]
```

## Arguments

- `-u`, `--username`: The Cassandra username for authentication.
- `-p`, `--password`: The Cassandra password for authentication.
- `-prefix`, `--keyspace-prefix`: The prefix for keyspaces that you want to delete (e.g., `sldmadb_elementdata_`).
- `-d`, `--delete`: **Optional flag**. If provided, the script will actually delete the matching keyspaces. If this flag is omitted, the script will only list and count the matching keyspaces without deleting them.

## Examples

### 1. Delete the keyspaces

```bash
./drop_keyspaces.sh -u username -p password -prefix sldmadb_elementdata_ -d
```

This command will delete all keyspaces starting with `sldmadb_elementdata_`.

### 2. List and count the keyspaces (without deletion)

```bash
./drop_keyspaces.sh -u username -p password -prefix sldmadb_elementdata_
```

This command will list all keyspaces starting with `sldmadb_elementdata_` and display the total number of keyspaces that would be deleted.

## Script Workflow

1. **Argument Parsing**: The script first checks for the required arguments (`-u`, `-p`, and `-prefix`). If any of these are missing, the script will output a usage message and exit.
2. **Keyspace Matching**: It queries all Cassandra keyspaces and filters those that match the provided prefix.
3. **Delete or List Keyspaces**: 
    - If the `-d` flag is set, it will issue a `DROP KEYSPACE` command for each matching keyspace, thereby deleting it.
    - If the `-d` flag is not set, it will just print the names of the keyspaces that would be deleted and count how many there are.
4. **Output**: After processing the keyspaces, the script either:
    - Prints a message for each deleted keyspace (if the `-d` flag is used).
    - Prints the total count of keyspaces that would be deleted (if the `-d` flag is not used).

## Notes

- Ensure that the user you provide with the `-u` and `-p` flags has the necessary permissions to drop keyspaces in Cassandra. Without proper permissions, the script will not be able to delete any keyspaces.
- Use the `-d` flag with caution, as it will **permanently delete** the specified keyspaces. There is no undo for this action.
- The script requires `cqlsh` (Cassandra's command-line client) to be installed and available in the system's `PATH`.
- The script works on Linux or macOS systems with a Bash shell. Windows users may need to use WSL (Windows Subsystem for Linux) or a similar environment.
- Always verify the keyspaces that would be deleted by running the script without the `-d` flag before using it to actually delete any keyspaces.

# file.py

import sys
from base64 import b64encode
from nacl import encoding, public

def encrypt(public_key: str, secret_value: str) -> str:
    public_key = public.PublicKey(public_key.encode("utf-8"), encoding.Base64Encoder())
    sealed_box = public.SealedBox(public_key)
    encrypted = sealed_box.encrypt(secret_value.encode("utf-8"))
    return b64encode(encrypted).decode("utf-8")

def main(public_key: str, secret_value: str, output_file: str):
    encrypted_value = encrypt(public_key, secret_value)
    with open(output_file, "w") as file:
        file.write(encrypted_value)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python file.py <public_key> <secret_value> <output_file>")
        sys.exit(1)

    public_key = sys.argv[1]
    secret_value = sys.argv[2]
    output_file = sys.argv[3]

    main(public_key, secret_value, output_file)

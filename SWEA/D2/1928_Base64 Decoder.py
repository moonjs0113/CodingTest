"""
1928. Base64 Decoder
입력으로 Base64 Encoding 된 String 이 주어졌을 때,
해당 String 을 Decoding 하여, 원문을 출력하는 프로그램을 작성하시오.
"""
BASE64_TABLE ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
for case in range(0, int(input())):
    s = input()
    padding_count = s.count("=")
    s = s.rstrip("=")
    bits = ""
    for char in s:
        index = BASE64_TABLE.index(char)
        bits += f"{index:06b}"

    decoded_bytes = bytearray()
    for i in range(0, len(bits) - padding_count * 8, 8):
        byte = bits[i:i+8]
        decoded_bytes.append(int(byte, 2))
    print(f"#{case+1} {decoded_bytes.decode('utf-8')}")

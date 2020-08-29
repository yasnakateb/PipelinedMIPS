from mipsdecoder import convert

def main():
    print("Type MIPS code below to see it in binary form")
    print("Press ctrl + z to  exit")
    print("--------------------------------------------------------------------------------")
    while True:
        mips = input("Type MIPS code here: ")
        print()
        convert(mips)
        print("--------------------------------------------------------------------------------")

main()

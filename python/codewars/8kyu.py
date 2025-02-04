# Create a function which translates a given DNA string into RNA
# https://www.codewars.com/kata/5556282156230d0e5e000089/python
def dna_to_rna(dna):
    arr = [molecule for molecule in dna]
    for i, molecule in enumerate(arr):
        if molecule == 'T':
            arr[i] = 'U'
    return ''.join(arr)

def dna_to_rna(dna):
    return dna.replace('T', 'U')
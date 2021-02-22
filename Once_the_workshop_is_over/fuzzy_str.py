#!/usr/bin/env python
# coding: utf-8
from fuzzysearch import find_near_matches
from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from collections import defaultdict
import collections
from Bio import SeqIO

wanted = set("""AGTTGCAAAAATACACTTGTGGGAGAAATG
AAAAGCTTACCAGCTTATTCTAGAAAAGTTGGGAGA""".split())

print("we have just found out what we assembled: Now for something cool\n")
print("""In the 2005 scandinavia realised that their Chhlymidia rate was
      decreasing. They gave themselves a good pat on the back and said well done""")

print("""lets look at the primers used for PCR diagnositcs versus a refernce sequecne
      and Chylmidia found in Scandanavia""")

print("""\nrefernce: https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-10-239
Co-evolution of genomes and plasmids within Chlamydia trachomatis and the emergence in Sweden of a new variant strain\n""")


print("looking at wt_palsmid.fasta")
for seq_record in SeqIO.parse("wt_palsmid.fasta", "fasta"):
    for primer in wanted:
        temp = primer
        test = Seq(primer, IUPAC.unambiguous_dna)
        #print(test_pep)
        data = find_near_matches(test, seq_record.seq,
        max_deletions=1, max_insertions=1, max_substitutions=1,
        max_l_dist=2)
        print(primer)
        print(data)
        if data != []:
            continue
print("\n\nlooking at FM865439.1.fasta")

for seq_record in SeqIO.parse("FM865439.1.fasta", "fasta"):
    for primer in wanted:
        temp = primer
        test = Seq(primer, IUPAC.unambiguous_dna)
        #print(test_pep)
        data = find_near_matches(test, seq_record.seq,
        max_deletions=1, max_insertions=1, max_substitutions=1,
        max_l_dist=2)
        print(primer)
        print(data)
        if data != []:
            continue
print("""\nnote: one primer did not hit: FM865439.1.fasta. This would not lead to an
amplification in PCR -  thus a negative result\n""")

print("""\nBasically a company in Scandanavia cut costs by only using
 one primer set for dignostics rather than two. This caused seletive pressure
 on the plasmid, and thus this region which should be amplified
 was selected against and therefore
 NOT identified during diagnostics.""")

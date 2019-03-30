From: lkml@sdf.org (George Spelvin)
Date: Sat, 30 Mar 2019 17:16:02 GMT
Subject: [PATCH 0/5] simple sort swap function usage improvements
In-Reply-To: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201903301716.x2UHG23t020732@sdf.org>
To: linux-snps-arc@lists.infradead.org

Great work; that is indeed a logical follow-on.

Reviewed by: George Spelvin <lkml at sdf.org>

I you feel even more ambitious, you could try impementing Rasmus
Villemoes' idea of having generic *compare* functions.  (It's on
my to-do list, but I haven't made meaningful progress yet, and I'm
happy to pawn it off.)

A significant fraction of the time, the sort key is a 4- or 8-byte
integer field in a structure at a small offset from the base or
list_head.

A function pointer < 4096 could be interpreted as encoding:
- Key size (1 bit)
- Key signedness (1 bit)
- Sort direction (1 bit)
- Offset (9 bits; +/-256 words = +/-1024 bytes, or 0..511 words from start)

With the correct level of preprocessor hackery,
SIMPLE_CMP_ASCENDING(struct type, key_field)
SIMPLE_LIST_CMP_ASCENDING(struct type, list_field, key_field)
SIMPLE_CMP_DESCENDING(struct type, key_field)
SIMPLE_LIST_CMP_DESCENDING(struct type, list_field, key_field)

could encode all that and cause a compile-time error if the key
is the wrong type or the offset is out of range.

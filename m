From: hpa@zytor.com (H. Peter Anvin)
Date: Sat, 25 Aug 2018 20:16:39 -0700
Subject: [PATCH] treewide: remove current_text_addr
In-Reply-To: <c62e4e00-fb8f-19a6-f3eb-bde60118cb1a@zytor.com>
References: <CAKwvOdkWL_2yTnJqM6n6R9UCPwY4iz-9BQYGN2MDAk9EzumUvA@mail.gmail.com>
 <20180821202900.208417-1-ndesaulniers@google.com>
 <207784db-4fcc-85e7-a0b2-fec26b7dab81@gmx.de>
 <c62e4e00-fb8f-19a6-f3eb-bde60118cb1a@zytor.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <81141365-8168-799b-f34f-da5f92efaaf9@zytor.com>
To: linux-snps-arc@lists.infradead.org

On 08/25/18 19:38, H. Peter Anvin wrote:
>
> If it was worthwhile it would make more sense to at least force this
> into the rodata section with the string, something like the attached
> file for an example; however, I have a hunch it doesn't matter.
> 

An even nuttier version which avoids the extra pointer indirection.
Read it and fear.

	-hpa

-------------- next part --------------
A non-text attachment was scrubbed...
Name: str.c
Type: text/x-csrc
Size: 1427 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180825/f016878b/attachment.bin>

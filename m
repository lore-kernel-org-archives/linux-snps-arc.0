From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Sat, 3 Nov 2018 13:51:20 +0100
Subject: [PATCH -next v2 1/3] mm: treewide: remove unused address argument
 from pte_alloc functions
In-Reply-To: <20181103040041.7085-2-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
 <20181103040041.7085-2-joelaf@google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fd939e7c-3d9e-760e-f20c-e7263f064153@users.sourceforge.net>
To: linux-snps-arc@lists.infradead.org

> ? There is concern that ?

Does this wording need a small adjustment?


> The changes were obtained by applying the following Coccinelle script.

I would find it nicer if previous patch review comments will trigger
further useful effects here.
https://patchwork.kernel.org/patch/10637703/#22265203
https://lore.kernel.org/linuxppc-dev/03b524f3-5f3a-baa0-2254-9c588103d2d6 at users.sourceforge.net/
https://www.mail-archive.com/linuxppc-dev at lists.ozlabs.org/msg140009.html


If you have got difficulties with the usage of advanced regular expressions
for SmPL constraints, I suggest to use desired function names in SmPL lists
or disjunctions instead because of different run time characteristics
for such a source code transformation approach.


> // Note: I split the 'identifier fn' line, so if you are manually
> // running it, please unsplit it so it runs for you.

Please delete this questionable comment.

* The semantic patch language should handle the mentioned code formatting.
* You can use multi-line regular expressions (if it would be desired).


> @pte_alloc_func_def depends on patch exists@
> identifier E2;
> identifier fn =~

How do you think about to avoid the repetition of a SmPL key word at such places?

Regards,
Markus

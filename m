From: David.Laight@ACULAB.COM (David Laight)
Date: Mon, 3 Jun 2019 11:16:49 +0000
Subject: [PATCH] kbuild: use more portable 'command -v' for cc-cross-prefix
In-Reply-To: <20190603104902.23799-1-yamada.masahiro@socionext.com>
References: <20190603104902.23799-1-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3dcacca3f71c46cc98fa64b13a405b59@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Masahiro Yamada
> Sent: 03 June 2019 11:49
> 
> To print the pathname that will be used by shell in the current
> environment, 'command -v' is a standardized way. [1]
> 
> 'which' is also often used in scripting, but it is not portable.

All uses of 'which' should be expunged.
It is a bourne shell script that is trying to emulate a csh builtin.
It is doomed to fail in corner cases.
ISTR it has serious problems with shell functions and aliases.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

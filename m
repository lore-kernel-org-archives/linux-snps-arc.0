From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 28 Oct 2016 23:48:46 +0200
Subject: [PATCH] lpfc: use %zd format string for size_t
In-Reply-To: <27a8ca4b-3259-17bd-acbf-ee809ec4f67b@synopsys.com>
References: <20161017123605.2217411-1-arnd@arndb.de>
 <18294392.WY3416IpNg@wuerfel>
 <27a8ca4b-3259-17bd-acbf-ee809ec4f67b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <13484858.soC083COth@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday, October 28, 2016 2:44:13 PM CEST Vineet Gupta wrote:
> 
> Indeed if I hack include/linux/types.h
> 
> -typedef __kernel_size_t                size_t;
> +typedef unsigned long          size_t;
> 
> then the warning goes away, so gcc is indeed assuming size_t to be unsigned long
> and not unsigned int. That helps a lot.

Ok, just be aware that this will introduce warnings for any
compiler that is built to expect an 'unsigned int size_t'
typedef.

	Arnd

From: trini@konsulko.com (Tom Rini)
Date: Mon, 19 Nov 2018 14:08:35 -0500
Subject: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
 <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181119190835.GO11247@bill-the-cat>
To: linux-snps-arc@lists.infradead.org

On Mon, Nov 19, 2018@01:51:41PM +0100, Marek Vasut wrote:
> On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> > 
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> > 
> > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> > 
> > Given there're quite some U-Boot tools that we may want to add later
> > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > still for compatibility we provide "u-boot-mkimage" with help
> > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> > Cc: Otavio Salvador <otavio at ossystems.com.br>
> > Cc: Martin Jansa <martin.jansa at gmail.com>
> > Cc: Ross Burton <ross.burton at intel.com>
> > Cc: Marek Vasut <marex at denx.de>
> 
> Do we want to generate one package per tool or not ?

I think so, yes.  Not all places will want all tools.

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20181119/9af71c05/attachment-0001.sig>

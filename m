From: trini@konsulko.com (Tom Rini)
Date: Fri, 19 Jan 2018 16:11:05 -0500
Subject: [U-Boot] Please pull ARC changes
In-Reply-To: <1516374522.3150.6.camel@synopsys.com>
References: <1516374522.3150.6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180119211105.GZ4660@bill-the-cat>
To: linux-snps-arc@lists.infradead.org

On Fri, Jan 19, 2018@03:08:42PM +0000, Alexey Brodkin wrote:

> Hi Tom,
> 
> Please pull a series for ARC.
> 
> Here we fix L2 cache (AKA SLC) operation found once we disabled
> usage of IO-coherency in U-Boot, improve support of clock-generation
> unit (AKA CGU) and also doing some minor clean-up and updates.
> 
> The following changes since commit 086ebcd40e9bf8efc520f1b177fd8e3cc0e506fa:
> 
>   Merge git://git.denx.de/u-boot-fsl-qoriq (2018-01-17 13:48:35 -0500)
> 
> are available in the Git repository at:
> 
>   git://git.denx.de/u-boot-arc.git 
> 
> for you to fetch changes up to 8f44e1ee799d75eb2b296a7525dc0c3003a3644c:
> 
>   ARC: devboards: Allow huge uImages (up to 128 MiB) (2018-01-19 17:59:35 +0300)
> 

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180119/fb21a768/attachment.sig>

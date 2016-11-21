From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 21 Nov 2016 14:53:33 +0100
Subject: [PATCH v3 2/2] DW DMAC: add multi-block property to device tree
In-Reply-To: <1479496356-27834-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479496356-27834-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2261617.2ELEafraaJ@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday, November 18, 2016 10:12:36 PM CET Eugeniy Paltsev wrote:
> +- multi-block: Multi block transfers supported by hardware per AHB master.
> +  0 (default): not supported, 1: supported.

Please clarify that this is an array with one cell per master.
My first thought was "why is this not a boolean property", and
I'm sure others might misread it the same way.

	Arnd

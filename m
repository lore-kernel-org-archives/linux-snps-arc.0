From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Dec 2018 06:44:38 -0800
Subject: [PATCH 3/3] arch: remove redundant generic-y defines
In-Reply-To: <1544009286-15705-3-git-send-email-yamada.masahiro@socionext.com>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-3-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181205144438.GA30692@infradead.org>
To: linux-snps-arc@lists.infradead.org

On Wed, Dec 05, 2018@08:28:06PM +0900, Masahiro Yamada wrote:
> Now that Kbuild automatically creates asm-generic wrappers for missing
> mandatory headers, it is redundant to list the same headers in
> generic-y and mandatory-y.
> 
> Suggested-by: Sam Ravnborg <sam at ravnborg.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>

Oh, that is very useful, especially as maintainance of those
generic-y lines has been a mess!

Acked-by: Christoph Hellwig <hch at lst.de>

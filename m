Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32005C30658
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jul 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/7I9I8oAxC/Sz9HYY54UVs3aVKAfNr8eSH67n+t56w=; b=u9NDd60bfVgxcE
	cgU8xxnntRw8s8e2FUkUvuXc+/bSuOrvU7pIHolc4PoOi5xKRx8TY/otAJ46riqn/jkSDY+qTjkVM
	1O5lO3GQz4qkDLiFpAe0/nf0gqC5wUrJQeynIbNb4+WuMn1fxieXNamYVkd9uBDjN6dGlttYEZCny
	trMcPAHjeqg+ynvNWAnlLie4MOvCEdXfnZ+VbKLS3aq+I4/RE2HcZaDuw5Obf/6nNgGrBZ5ZKhT2F
	lSdyNjrb2/dkSfgb9HVBxK3YqelsuJyjhwwv0rUyPxGSCo/cjUD5Pa46f5iciJ+9jY8JNwQJh/Ig4
	V6eCHw2m83sOPViVT5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPg1Z-0000000FcdM-35RB;
	Fri, 05 Jul 2024 10:18:41 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPg1F-0000000FcYX-1aCn;
	Fri, 05 Jul 2024 10:18:23 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E3DCF92009C; Fri,  5 Jul 2024 12:18:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DD96792009B;
	Fri,  5 Jul 2024 11:18:14 +0100 (BST)
Date: Fri, 5 Jul 2024 11:18:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@kernel.org>
cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
    Masahiro Yamada <masahiroy@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
    Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
    Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
    Stafford Horne <shorne@gmail.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, 
    Christian Brauner <brauner@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
    linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
    linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
    linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 00/17] arch: convert everything to syscall.tbl
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
Message-ID: <alpine.DEB.2.21.2407050323400.38148@angie.orcam.me.uk>
References: <20240704143611.2979589-1-arnd@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_031821_600122_8EA9AEC4 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 4 Jul 2024, Arnd Bergmann wrote:

>  arch/alpha/include/asm/unistd.h               |   1 +

 This seems out of sync with the actual changes, any idea what happened 
here?

  Maciej

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

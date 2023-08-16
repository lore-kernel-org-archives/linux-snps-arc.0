Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0430C001E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Aug 2023 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3caLnsqPnCUePpXMlQkIoYZdzAWx73pUW182GphJ8w=; b=EDbjot3sMK4p9Q
	LHyvg16psrkO4HHxQFKfxU1U6in03s052UVWnnxgVcBbi7sb9WoJ63gWMhtjPfAhCejypXfczvX9u
	H0SxhHLi9IwKApcVU6gqjAZr8EOD0cYt3xJIMSEZ+zFqBP8GYtoRyooPpxREeQG4Ui6HBl++zmWZp
	ROeNEvXM/edVokBp48UDadj4503VVCXHRtV9UxHCkk9yu2MazcjGfUe+Y/gCZOrOL4dDzSNMBzBEb
	H1EGoWOz38gWU8sDnY9h/pjQ846s43cpcnBM0th95ACLP6LD2ll7wYW9G72VrjetWeqnTjwa3ltbN
	oRzmTNg2KA7L2RFOWBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGK0-004Dvi-0o;
	Wed, 16 Aug 2023 13:12:24 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGJw-004Dtb-0V;
	Wed, 16 Aug 2023 13:12:22 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1C83A3200941;
	Wed, 16 Aug 2023 09:12:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 16 Aug 2023 09:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692191534; x=1692277934; bh=ZR
	T106v0hiqgMDmrCmS6eySFqP6+naQFmpKPfl1LC4A=; b=vnOGsLEBWf6iRqdcGe
	aKN5BWG0fJGAVU6JVIXw2r5trEbi4U8HGAkyD0+6xPYUebCuLdj/BgvHcLXQ3VWz
	DM86GEBHF5q/32OBTSQ1jAmNdTLIKRxKeTpDjT17bQgiqwms96qRRheqtFVNxibZ
	hwb68kNFhtdjc0mMi067Ltuik7Sz8Ub0DzdHrBDczZvPLkmNw72p43WeSwcA6Uhd
	jlAAKWZ6Al07ksUMdho4dSrDxHjxQNY7apoz3xCtR88uxRhkG9xkFDGscnnRTo5l
	WiGl5SfVo9TNOcr+c7G2H0chHBT3ePUGo7ZEdPXRmkEqRq9XFAWEkvI8BxCAowqC
	qylw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692191534; x=1692277934; bh=ZRT106v0hiqgM
	DmrCmS6eySFqP6+naQFmpKPfl1LC4A=; b=J253saPLCyaYpeIDlShp7YvjJgenV
	Ht1wUlTeHrAp+sMBGixfNZyUOs+v29RrlwC/Ff32lR6rR8Ptf/e2eCzpS7zg4WOK
	JYImEvkjD5EcWi13FT1qPlKSW+lxLDrtzkAe+SPR9zQ5OXHVI5o5ZavoAdaJjrvF
	mYs/WGtCNnfkuosVJ63bXDJlTIEuUUTya6gHAHWER0NlUHQA4H1Y/6SUWW5k7VGX
	CgelTXP6IMV844RF/eUDrOP+e8y9sL3KhWck/HUsbwg8VPAFec37UpcjQLZf4mWh
	uldSfe9YCl3AXDW8zsfBvdpTuUvrJa25ROBLezhFUT/OIhB48LEBQcZnA==
X-ME-Sender: <xms:K8vcZHO8GGtKsWaqQcWz1qpw7lABKKHBkhe_YqZz2EzFfnfT05ISiA>
    <xme:K8vcZB-r0Y6dBNf9v4cUL_7yF6uQAKk9sv7-_V3dOoxP_cvdsp3JLUt2S3lonyhXT
    Ls1v4Sr_SabhXlhEhc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:K8vcZGQO-MgdXr5jJldoDAQTHH6Ovgm0uSHlTvzKqKADkMryTvW66g>
    <xmx:K8vcZLtkn6_JnzcwFpD1vZfMnl9JtfeWnWAVnzNARqjEiksaIcRtOg>
    <xmx:K8vcZPepBT5Oy2rf3fQLmMFTs8XTCaO1eXozKuHr43Q9B1oPLmqWGA>
    <xmx:LsvcZBc7lnjA2S24fyGf-1Kbi-eqlGDcVFzJeOS9w2dwF53-Geo3HA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C1305B60089; Wed, 16 Aug 2023 09:12:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <0681968f-743d-4b55-bb1e-dbd665ea8783@app.fastmail.com>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
References: <20230816055010.31534-1-rdunlap@infradead.org>
Date: Wed, 16 Aug 2023 15:11:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-snps-arc@lists.infradead.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, linux-hexagon@vger.kernel.org,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Josh Triplett" <josh@joshtriplett.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_061220_222161_ADDF7094 
X-CRM114-Status: UNSURE (   8.20  )
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

On Wed, Aug 16, 2023, at 07:50, Randy Dunlap wrote:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

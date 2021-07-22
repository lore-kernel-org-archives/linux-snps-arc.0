Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7946BC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F395860FF2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F395860FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCKxv/UnFmUNZ4c2Ox5mxSL25tWInwmAUWSMFKczKbs=; b=jl810AVVMY1k7m
	tvh5IgMDobIQY9TvJIZDlLA2GvyHn3Lb/6tAp1tXvjWbCyxTSrkafayxKnYYYl3eLrmwd2/2C/wXK
	uxkyz52Xn0m9HNyWUrtRKc7MVYYJCqwfBUZ/ruhQVjS+txKZNokw4l5NdPsCpbnCpNk/RdLTlHCUq
	iLI65vYQUOLf0K5QlEgeJhqYmuMeqvbJKFuXSJsDlcpFU3RPRgN/c3r1dFzBOpoHKCsP+aDVvhlLI
	yxzQeQcZFtAYfeRh4jHmHlJNXzt9WiUScCMP75tAvEIbwHo2wrOuFq5/H+vOy56J64O0Fl5W06Agl
	/yLVFk6pRfpJuJQpH+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Yq4-001gdy-3C; Thu, 22 Jul 2021 13:34:12 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6YJM-001ZW1-Jd; Thu, 22 Jul 2021 13:00:26 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7EA5168B05; Thu, 22 Jul 2021 15:00:22 +0200 (CEST)
Date: Thu, 22 Jul 2021 15:00:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Jeff Dike <jdike@addtoit.com>, Linus Walleij <linus.walleij@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH v3 3/9] hexagon: use generic strncpy/strnlen from_user
Message-ID: <20210722130022.GC26225@lst.de>
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722124814.778059-4-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_060024_855867_2054AC98 
X-CRM114-Status: GOOD (  12.10  )
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

On Thu, Jul 22, 2021 at 02:48:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Remove the hexagon implementation of strncpy/strnlen and instead use
> the generic version.  The hexagon version reads the data twice for
> strncpy() by doing an extra strnlen(), and it apparently lacks a check
> for user_addr_max().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

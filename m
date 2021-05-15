Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8054DC433ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 06:40:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D541B613EB
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 06:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D541B613EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7wHY4zCB9pP7iDJtcCS9cf8T3kMIL6EAq+eJFH336pg=; b=H+AgBbUCl4SCcWFrcTKAmnZVS
	zvjMbMhsVQrU1U9iWycVxldpeLnK9YwzBJrWbFQb7e6m80ZdnayG9vgjHMJdLZzJJ0esYkrBM0ZoR
	poSE2O02Z3WX0r0kVKp8JLhySIbnJXhsZT7pp3nV1DR1zC9aCPIB5uYXQ++C8BEWK66VbQsw+y/6z
	wUxG+WPMBM8xgcVamnWKwaF8PKqwzBfPRhz3GoGNBMFGjRbyn8PopZa5iw8FPEeDCAcoefwb/TYqD
	7PlE4myn/1q2flt7wC74ftp0XR2eeS0aA55gyRYvNjs/uimlEYZ7CQdu7hUJPkmz/3IVI2HCBT+f2
	/8ke1jYeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhnyO-009qp4-4b; Sat, 15 May 2021 06:40:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhnyK-009qog-MH; Sat, 15 May 2021 06:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7Z0J3EEBcEncLC7nHgwWUBdbf90Vc3H0pkJupV2WLPA=; b=imHhvSLIO+OFpKvFEEwWne4bYW
 /WqjaYdhmJl352yeuLqfPgdT9N+4J9zZu82B51l4RXk0nm9j9B6CumvV+9Ib3tb5XeClHN2pXHVma
 8oGA9xQDY9/Pg3n3GpYZeVecwMAwxRqOGlo/LAyTP5fXNJasnjBqWcelQzmesTbCht+xXdtg/a+1V
 upF9RNtn7/mts6zB45UNBr7DHFegeOg3e3ySSAP/rfNh+4t+NdtaZ7eK7xIKN40Da0IRMfXoN2h2A
 Tz2SNMH+lW7LWy7QxJqopRRa8NC1sZY+hvd1pMRWSDiHCmNB9P+5V69j7GH3vi6Oxhfk41SZhi2HY
 ke6lcbRQ==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhnyH-00CPr0-Ov; Sat, 15 May 2021 06:40:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0F3AA6736F; Sat, 15 May 2021 08:40:15 +0200 (CEST)
Date: Sat, 15 May 2021 08:40:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Sid Manning <sidneym@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 0/5] asm-generic: strncpy_from_user/strnlen_user cleanup
Message-ID: <20210515064015.GA26545@lst.de>
References: <20210514220942.879805-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514220942.879805-1-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_234021_986251_A6FE8BF0 
X-CRM114-Status: UNSURE (   9.25  )
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

I generall like this consolidation, but for the patches that remote
the arch / asm-generic versions, can you please elaborate a little
more why the lib version is preferable?  The current commit logs are
not very informative.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

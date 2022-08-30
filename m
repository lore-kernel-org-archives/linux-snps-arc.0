Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B135ECAAA1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Aug 2022 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXGrOnMyxA1hpk8K+IBhcGKabf3hfvslYM+HjRh2QHs=; b=ALhpdzEOCS6kTi
	01FSX1WtZyGvrXFefGzKFlKkMPg8WrxVwyuO7zrftXH+7Kl9fE14PCJxo3c8IrxCMQk+mNCgDALiY
	wJTh/8982Qy94nfjmx8cOGwEonkY9OnX7pON7+YjoOxLT1dADOINjkV9oBizUbjklXz1DvowhBSAZ
	ZQxTF/yBAMHkshMDjzsQsvRSdB7+FHwj4TrHNw16C3EgG2bNogkcrNrPjFWQW90fo8E/WtmqW40jk
	6oGMPAz3uUHil2m3XOaGawYpAXoDlN3BWn6wr0by28GefGFPij5BbqoFSA1namPzj64PQKB2cSFqw
	7UMRPEC4V4MPkMPwDXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT26Q-00HYTa-Ss; Tue, 30 Aug 2022 14:20:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT26M-00HYPK-8s
	for linux-snps-arc@lists.infradead.org; Tue, 30 Aug 2022 14:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661869221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tORAGdOuIEyxqy7Xiz8FX0cV5xzTMMZWt6i8kmL4jMo=;
	b=Ie6LLXdKPMlRPG6sI8f3ZImWdaktUnwW5IXK0FvgeMk3j9rsONoKwo26+XjieoWvrU3i8W
	Av+Qfsvn6y+n4ufuTmzaY2eNnDCZ2T7yXj0j2eyQRkbCEK1qhdG6BTUJuqIq8eu+SEBpXt
	xZzR0oEvH6YRa65mjQBUIgZLmeF2NSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-l7kwZy8tMv2HEIQ0v8HnPw-1; Tue, 30 Aug 2022 10:20:17 -0400
X-MC-Unique: l7kwZy8tMv2HEIQ0v8HnPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 897F1101A54E;
	Tue, 30 Aug 2022 14:20:12 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.123])
	by smtp.corp.redhat.com (Postfix) with SMTP id 8D16B492C3B;
	Tue, 30 Aug 2022 14:20:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 30 Aug 2022 16:20:12 +0200 (CEST)
Date: Tue, 30 Aug 2022 16:20:07 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: guoren@kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: vgupta@kernel.org, linux@armlinux.org.uk, monstr@monstr.eu,
	dinguyen@kernel.org, palmer@dabbelt.com, davem@davemloft.net,
	arnd@arndb.de, shorne@gmail.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 0/3] arch: ptrace: Cleanup ptrace_disable
Message-ID: <20220830142006.GA20935@redhat.com>
References: <20220830065316.3924938-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830065316.3924938-1-guoren@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_072026_423132_827BE634 
X-CRM114-Status: GOOD (  10.85  )
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

On 08/30, guoren@kernel.org wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This series cleanup ptrace_disable() in arch/*. Some architectures
> are duplicate clearing SYSCALL TRACE.
>
> Guo Ren (3):
>   riscv: ptrace: Remove duplicate operation
>   openrisc: ptrace: Remove duplicate operation
>   arch: ptrace: Cleanup ptrace_disable
>
>  arch/arc/kernel/ptrace.c        |  4 ----
>  arch/arm/kernel/ptrace.c        |  8 --------
>  arch/microblaze/kernel/ptrace.c |  5 -----
>  arch/nios2/kernel/ptrace.c      |  5 -----
>  arch/openrisc/kernel/ptrace.c   |  1 -
>  arch/riscv/kernel/ptrace.c      |  5 -----
>  arch/sparc/kernel/ptrace_32.c   | 10 ----------
>  arch/sparc/kernel/ptrace_64.c   | 10 ----------
>  kernel/ptrace.c                 |  8 ++++++++
>  9 files changed, 8 insertions(+), 48 deletions(-)

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

Return-Path: <SRS0=oPyE=PS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27961C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 17:38:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91F660FE7
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 17:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D91F660FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3JL5Ol0m2i9WndKX3SJCXRZsUl4ubEQ/ONdOLRFqfo=; b=qgs4iqvFt0eK6/7ybB8vCtUDVY
	vErJaRfQyr472aFj7DeUP3SV0xPdtO1fFXYKG3SAvxsQYZqSCWrWTLgfNx+wWW7hAiNRNZMw0ODpA
	2TVe5ocgHtxrJrN5rQ6suPaqt5AM+JPToJBBboQxw9hfFuCSBi7kJfrVVNFpRMBLkbsGqRSGUvXeb
	tD0Aq0Vp1H9SmZqwcpUwI6X/PEIhXHTsbXML0W6/GkyUzUKetk8TXb4ytFPsg1iznl/jv09idfH+h
	A75HnL+XL1jwgcIuOKkH/62BxfKTK3+k+zobu2gIEmpeqAl7Z7s7C7w8ZUy+495zULoNag43umYj2
	vJin6A1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsIr-00DJ5T-9e; Sat, 30 Oct 2021 17:38:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgsIo-00DJ4u-Hs
 for linux-snps-arc@lists.infradead.org; Sat, 30 Oct 2021 17:37:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33B8B60720;
 Sat, 30 Oct 2021 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635615478;
 bh=BuK/uYqM1dgqKmccHnE/qx/smXW1xtVGEwfHWbKEIGU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mFxuCo7j4XOvzrbIXdIJB1HyPYXdiSEk3leCE4+PEQcbph1SBxFy/PViD6McxCGTd
 zM9dh3Z5Fx58Iyv5PzamF7FhsoCJqZ6EXVKFZTVPLHkLkhjQk+CjdNQR2iA3awFIXy
 xTI36J7B5oX0D+oKzAbtLz5S+T+s1g3YuiHFUJWGpiYsBxjplDIVGgatmBzPh74mlY
 x6QTVgFb4oJkb+fCrIIVQGlPNk1YR//975wL0P8aF7B0hCid+dQFow4gyLm6c+ZuGN
 h1SE5/0DSrfBoFYRJrRHl8KDaQUkIbiajPS1sQeAsX2VRHftA4T1qlhLXQfUgof8J9
 oN4MS3g4MPWCg==
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Chris Zankel <chris@zankel.net>, arcml <linux-snps-arc@lists.infradead.org>
References: <20211026100432.1730393-1-arnd@kernel.org>
 <20211026100432.1730393-2-arnd@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <598ea503-6aae-837a-c5fc-b8dfceb04ef8@kernel.org>
Date: Sat, 30 Oct 2021 10:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_103758_650651_E8F9BAEE 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/26/21 3:03 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arc/Kconfig              |  1 -

Acked-by: Vineet Gupta <vgupta@kernel.org>  #arch/arc

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

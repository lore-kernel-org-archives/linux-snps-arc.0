Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA9C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839152077D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QyWFRI+6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfERwxMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839152077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftULUUwmyL27Av1wXWgv0mXb8VYInUqmWbMn1FCaG3E=; b=QyWFRI+6HKhI8l
	+C9Bnuj1kwEkIc5rSPYc+aBvwU3Pmru/8xfSM25eBRl7XVDNvIG/Guf4rondjqeraEuRluI3OHpOS
	zLpZ4z35Fs7TeBJHpVMLIulBuPUfxDjgfSSa+tQiHkDSBgoDnrjPT6sgk49JCMZJbnszzfrpyCnpv
	7uLUrdc6aYe6s5oDtPFP8q4+G9DhiE5ypcghKxPLg+NvnnwP5eXVZv3iKtEfzEB7iFEdL4qVTGKJ8
	HS1pla1JvihKFD/Wz81gII4R9kXsFcWO5a44HtbJvPWu7iabGHnF6uDBlwVsjE0rdXwSjXM3CmzHU
	wn9BXr+DRG27HIxqI68Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgjVt-00068b-B2; Thu, 04 Jun 2020 06:38:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgjVl-00061i-Kx; Thu, 04 Jun 2020 06:37:59 +0000
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6B9206C3;
 Thu,  4 Jun 2020 06:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591252677;
 bh=O1a535rP16XFYofg4bMZWQkFl2JLEEYgVYDf/xPj9AA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JfERwxMXEu2kI9XoIT9dWNXO1rREUwNy4knLypfsDDn3RoK04PQ+VcJ9cU4AiLvZ9
 zgKMGrd4au2WatdA8yMk1LlH6XWepwggHO+6JEHEW8/tg+Uifk/2Ah/6wTBJLxUsMO
 hIlar1DcvGQ6J2i69MlWxGfbGkXBQIZ5oY21iu3Y=
Date: Thu, 4 Jun 2020 09:37:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604063745.GB202650@kernel.org>
References: <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_233757_711073_74170BF9 
X-CRM114-Status: GOOD (  10.33  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jun 03, 2020 at 11:22:26PM -0700, Ira Weiny wrote:
> On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> 
> With linux-next on sparc I too see the spinlock issue; something like:
> 
> ...
> Starting syslogd: BUG: spinlock recursion on CPU#0, S01syslogd/139
>  lock: 0xf53ef350, .magic: dead4ead, .owner: S01syslogd/139, .owner_cpu: 0
> CPU: 0 PID: 139 Comm: S01syslogd Not tainted 5.7.0-next-20200603 #1
> [f0067d00 : 
> do_raw_spin_lock+0xa8/0xd8 ] 
> [f00d598c : 
> copy_page_range+0x328/0x804 ] 
> [f0025c34 : 
> dup_mm+0x334/0x434 ] 
> [f0027198 : 
> copy_process+0x1248/0x12d4 ] 
> [f00273b8 : 
> _do_fork+0x54/0x30c ] 
> [f00276e4 : 
> do_fork+0x5c/0x6c ] 
> [f000de44 : 
> sparc_do_fork+0x18/0x38 ] 
> [f000b7f4 : 
> do_syscall+0x34/0x40 ] 
> [5010cd4c : 
> 0x5010cd4c ] 
> 
> 
> I'm going to bisect between there and HEAD.

The sparc issue should be fixed by 

https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org
 
> Ira

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

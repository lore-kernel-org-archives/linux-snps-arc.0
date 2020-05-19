Return-Path: <SRS0=mq+M=7B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC4BC433E1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 16:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621A820842
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 16:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/gd09BV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US3KTRvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 621A820842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlMtMQpG4HdDfrPjObCd9Mx0gAxDamI7FS9YKjfhph4=; b=o/gd09BVzdpC/g
	h/xi24uGKgBHQcyqWPFNfSKzwkuXKN5PNN0kTZYfczxRWCo2AuCR9wFcHfkgXsa2VlLZzH5ZKcWK/
	f7JJhpU7LojHpKiY4KnFAf+gTWowODrXx3ECw8RjGYv25yun15plG5ixYRIGnsZendt9yN5lsLlPh
	bRuU3sNXsfkx5zajHrvFD05OC/exVP5/qlIeUwiRVssQiUBLb12fg/aplz/xwflLnwGO2ROOJKlBY
	JlgjWdnxLH7KLl1d3xwQMtkt4Pd/jGR7/U7nCez9HZZHhj/i6XWB/LhqPU5uzLdj0T1tlwJGfIjJf
	6ngCkkXYM19CnHSyfqlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb5Vb-0005z4-Kl; Tue, 19 May 2020 16:54:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb5VZ-0005y0-5y; Tue, 19 May 2020 16:54:26 +0000
Received: by mail-pf1-x442.google.com with SMTP id y198so189511pfb.4;
 Tue, 19 May 2020 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=US3KTRvNcsr1JQ3EhzPolHH5YLTbLmBZ8QACOxRX4DSdLWVJ77w+ufdLjru2exOJj5
 cGgDdNSpGJSLCToXHOYtummYRYMikc607MQTtZw3CIAeMX52xLfkzXJFnqV++/4JZPBX
 TkfA6bA2OQ/tBu0verEpOr/8yTMghh7JOJnq8blVosibdSwn9t4VGf6TTFO3jl9Ku+S6
 us7ewjcIE1yEdgRycst8zGi/M73AaWLcbuldE63QokhOzCU4Lv6vQlzl3U74bTRQpiDW
 76aVV76mP+yZNV5Arg3qVa0f6SZeHYOumZT/8SZvPzqHfkPYn2L9uFwTaop85+0WCxz9
 dP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xmBBbLK3vjWE/EyjvUc68p3tw/EXGXu0OK+6vpkbzqQ=;
 b=TG4ROQeGgGXYqYz9V9rWAKNWxpyxmYUtGttGOqm+O9V29H1aWc+QRiPFIrf9CpDllN
 e9Z78ldRum3JofOV+iRj0W7/DKc9LO9yGXuNJqxJ7yQqQ0TXM2BYZw/wnqdYGrvT0Epy
 fOJP0eNmWVoi684BSvaEa0yIFa7o+9nHSPRQny0j8YaxhwJ3Q1pntGdspM2c6bWl2GRb
 cBrEfJHmqIylsHCVmiMFaUxpbxrv7JDap8RmKKf5EJWzNQfoHlw03zV+WBn2SmFLgRdk
 N0X2gWyE5EANbX7EO4A7z4o/ccfzIV4wEh4Yf0xxSCsJJVeUZXeAbx8PfyOu9Fq3WJgP
 v7vg==
X-Gm-Message-State: AOAM530MAWhBO7pxJ7VQws23MAsHng0R2rFexlRCSHRqzQgbOY9rCZ1P
 QIfY8H2Z4dFQPLdylcXlFSI=
X-Google-Smtp-Source: ABdhPJyjXg6Tl4Trqy/ovTHZ7agsZDG2QZ23n+CG2Df9YrHRxk8WNFN4fKgw/J0SX04nl9fKvZEDwg==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr36511pfa.15.1589907263910;
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id go14sm111069pjb.42.2020.05.19.09.54.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 09:54:23 -0700 (PDT)
Date: Tue, 19 May 2020 09:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ira.weiny@intel.com
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519165422.GA5838@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518184843.3029640-1-ira.weiny@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_095425_240096_1FAFC3FB 
X-CRM114-Status: GOOD (  11.93  )
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> enables when vaddr is not in the fixmap.
> 
> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

microblazeel works with this patch, as do the nosmp sparc32 boot tests,
but sparc32 boot tests with SMP enabled still fail with lots of messages
such as:

BUG: Bad page state in process swapper/0  pfn:006a1
page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
[f00e7ab8 :
bad_page+0xa8/0x108 ]
[f00e8b54 :
free_pcppages_bulk+0x154/0x52c ]
[f00ea024 :
free_unref_page+0x54/0x6c ]
[f00ed864 :
free_reserved_area+0x58/0xec ]
[f0527104 :
kernel_init+0x14/0x110 ]
[f000b77c :
ret_from_kernel_thread+0xc/0x38 ]
[00000000 :
0x0 ]

Code path leading to that message is different but always the same
from free_unref_page().

Still testing ppc images.

Guenter

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

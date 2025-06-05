Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD73C5B543
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Jun 2025 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rL6VuNb9N5J7q+Qm+W8bQv/3Ubd4E2fJFe0tcBlHG3k=; b=uvSNT0F9v8cB5j
	0kpRAB1ovE44xjGawfZXbhDxbwdDQPDjBb7qNRi++TYEFCAp32IsD5POg9llCeTfkNhgx42FtYnrn
	qtMVxO/HlCfZCqIQh+F4N7YgkpwOMldCN34V0eS9FA8I/QK12iQVyutHHGNBOWtupj3BsN+Oo5Z5l
	9Sg8hqLgVvTpA1Eu4zTjLcUB1/H+XmLFzU4n7JTLkCUJZZFODVA56q+HAU0+1CkeppE7lgdcwESlW
	tChms9f+k4wdx9z2oX/ui1sCXqb11/3dAAgwqpgoC4qqWA4L5Q1NJPu20iIcN3fmrydTztZ6YURYN
	lZZAaHyC5Ez6GMveV+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGb5-0000000GXDt-3sIm;
	Thu, 05 Jun 2025 19:49:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGb3-0000000GXDG-2YzJ
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Jun 2025 19:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D48495C4A7B;
	Thu,  5 Jun 2025 19:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246DDC4CEE7;
	Thu,  5 Jun 2025 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749152992;
	bh=jOwZ313B3PyOo+NoZHWXuNGQv8GixcX7GIw1tpZUsD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d8UnIlF4VMA6gZnLSctFUWX7OwjEycVLy5WaWcP8VZ9hnV3yszLfOWH/3XI9EJeLi
	 AVX/6f1lY2LZRijW5vMBgmQzmGgacXsBRt3cS8G6QzWKcUNeFJg4BFqIs4ekc6Gv9U
	 KWtw7n11Ct5U5EZdvAmIW0WwWYmsaRaXIcC5hY/61XfxdgXigBSHzQ1AuoDleKC5HL
	 qIWr97bJT0cKSiF8khtL2Car+UaC1tdDzNr5f1r5zrOJR/tWMI98ebWGYQHUaHk7n4
	 4A0ODvJ742u/CZSgLZCj2dV607rHjiY728De9m4/ttzhvfYJbnGqytobZKtwpCDowm
	 knOgp6btUxxqw==
Message-ID: <46e93ad7-5a1b-4aeb-99da-216eff6f484a@kernel.org>
Date: Thu, 5 Jun 2025 12:49:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/41] arc: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 non-uapi headers
To: Thomas Huth <thuth@redhat.com>
Cc: linux-snps-arc@lists.infradead.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-6-thuth@redhat.com>
 <1aae3659-2b5d-4293-891d-1e19ad4800c0@redhat.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <1aae3659-2b5d-4293-891d-1e19ad4800c0@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_124953_696247_52464A35 
X-CRM114-Status: UNSURE (   9.66  )
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



On 6/5/25 11:21, Thomas Huth wrote:
> On 14/03/2025 08.09, Thomas Huth wrote:
>> While the GCC and Clang compilers already define __ASSEMBLER__
>> automatically when compiling assembly code, __ASSEMBLY__ is a
>> macro that only gets defined by the Makefiles in the kernel.
>> This can be very confusing when switching between userspace
>> and kernelspace coding, or when dealing with uapi headers that
>> rather should use __ASSEMBLER__ instead. So let's standardize on
>> the __ASSEMBLER__ macro that is provided by the compilers now.
>>
>> This is a completely mechanical patch (done with a simple "sed -i"
>> statement).
>>
>> Cc: Vineet Gupta <vgupta@kernel.org>
>> Cc: linux-snps-arc@lists.infradead.org
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
[snip...]

>> Friendly ping!
>>
>> Vineet, could you maybe pick this (and the previous patch) up via your arc 
>> tree? (x86 and parisc already got merge via their respective architecture 
>> trees, so I guess the same should happen for this patch here, too).

Sorry, this fell thru cracks. I will queue this up for 6.16 fixes, once rc1 is
out and we can start pushing new code for landing into linux-next again.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

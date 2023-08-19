Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3C4EE49A5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Aug 2023 23:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMs1plMKDrVPMa3fAuctE2nCNvyHsYe7RreRP3sLQ3I=; b=PUR0WC6jGZfffu
	TSqkFHU9xf9nGDQFqIzE22cTu339qGUtpgk8+MbhXtikLE8BNxsct6v4MtY/VIE/ATsaxjnVC+282
	HB4y8fLEOBe+1xrlzx1u+Ds4cwubxfWMZmKJON8cY9oQIQ6ck+PVBgInSHFqfJrViv40aae5ODiNd
	rRJ09BDAI9EhOZED1DSLhOinDtJX9sWxPMY7fB/tsWxwIpsc4myq7C9Hg7gTD2j+uiRmWWe39YbbJ
	GUn5/ZvXWNODqqhD/YqdGc66kIO3j23sivjOFJDzFf0q1PJyzY5H7d4l6xK4qL+x0FuQr9zE3uEw2
	TEs5lXpYr9ytbUImDAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXV8m-00BEXN-1u;
	Sat, 19 Aug 2023 23:13:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXV8k-00BEX0-2Y
	for linux-snps-arc@lists.infradead.org;
	Sat, 19 Aug 2023 23:13:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D646F60919;
	Sat, 19 Aug 2023 23:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD4FC433C8;
	Sat, 19 Aug 2023 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692486833;
	bh=BVT53e23X9XrDvxuObUy2+IXkk6QBgsv6gatKgYdiEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h298QTxsdirjP/Roz1SRBzjZxKI4+ZKPs4qWphaFYV+jXcpxG9Wc3KlrpOiRezk6e
	 QuFxTzHNBvGfZ0p0LJEc61AgRoa4KcacImdIQhi0YZJmLrDyUZUcTFt1zyEKpaigxb
	 5/5rKWmSnNrkDXVXz7skXSNM41Z+nJPwqwOewE7QL4Z4cVcJ+gSq4Me/6fKmCupH04
	 9Jykx4zMPWtAT2DxYcG625aKwzWK74VpgqweboXog6UDLkDq0ztsUvLaZTSKND18eB
	 Y12HIH7qNv6XZTYsxk+4yobtxfagd35Qjy8Y5l5zXZZBbzrf+IdyofjUYtgTSA+TTe
	 Y336IYxBriauw==
Message-ID: <3f555ce3-1bf7-d55d-bf84-da75659f1042@kernel.org>
Date: Sat, 19 Aug 2023 16:13:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/20] ARC: entry: Add more common chores to
 EXCEPTION_PROLOGUE
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
References: <20230815004813.555115-17-vgupta@kernel.org>
 <20230818125652.3981-1-kozlov@synopsys.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230818125652.3981-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_161354_891507_9780A47F 
X-CRM114-Status: GOOD (  12.87  )
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

On 8/18/23 05:56, Pavel.Kozlov@synopsys.com wrote:
> Hi Vineet,
>
>> Subject: [PATCH 16/20] ARC: entry: Add more common chores to
>>          EXCEPTION_PROLOGUE
>>
>> THe high level structure of most ARC exception handlers is
>>   1. save regfile with EXCEPTION_PROLOGUE
>>   2. setup r0: EFA (not part of pt_regs)
>>   3. setup r1: pointer to pt_regs (SP)
>>   4. drop down to pure kernel mode (from exception)
>>   5. call the Linux "C" handler
>>
>> Remove the boiler plate code by moving #2, #3, #4 into #1.
>>
>> The exceptions to most exceptions are syscall Trap and Machine check
>> which don't do some of above for various reasons, so call a newly
>> introduced variant EXCEPTION_PROLOGUE_KEEP_AE (same as original
>> EXCEPTION_PROLOGUE)
> I'm observing the ARC700 (nSIM) system freeze after this patch.
>
> ...
> f0000000.serial: ttyS0 at MMIO 0xf0000000 (irq = 24, base_baud = 3125000) is a 16550A
> printk: console [ttyS0] enabled
> printk: console [ttyS0] enabled
> printk: bootconsole [uart8250] disabled
> printk: bootconsole [uart8250] disabled
> NET: Registered PF_PACKET protocol family
> NET: Registered PF_KEY protocol family
> clk: Disabling unused clocks
> Freeing unused kernel image (initmem) memory: 2856K
> This architecture does not have kernel memory protection.
> Run /init as init process
>
>> @@ -128,11 +123,6 @@ ENTRY(EV_PrivilegeV)
>>
>>           EXCEPTION_PROLOGUE
>>
>> -       lr  r0, [efa]
>> -       mov r1, sp
>> -
>> -       FAKE_RET_FROM_EXCPN
>> -
>>           bl  do_privilege_fault
>>           b   ret_from_exception
> The same update is also required for the call_do_page_fault wrapper for ARcompact.

Indeed I missed that part.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

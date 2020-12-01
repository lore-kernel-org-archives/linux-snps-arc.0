Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0200AC64E7A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:03:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3F720691
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DOKVMqCa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="MuJqInQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3F720691
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5RPZZhI5Vx4b9mRkd8VetDcuqqsJmhXGQjD1Ilw5n8=; b=DOKVMqCa6lleFBVXSF/fg2vPJ
	KujzklekNbLvujNpJF20wn/42qKaBXGlS3GZ90qacDUrTXt7kxmRLSlq3qm2EvD7dZDcudyehUFnu
	KTIXNvINfL+F51vL7MeZTZS3/wYTuG8cOlEf5/Fb/2mdHl7cIMjKuibC1wc2oHQAX8ZGuA24POsqF
	snj7COWhlei3MBgZtGme6t44ekB9qKVBrBrE48u4lF7BIiVRlXzC1MDGYDxMX8gDZdsJlajiPnT5R
	yXJZeqlDT/OiiFH0/uknYgMpGD2FpZpLQkWSpYr5JkzcR/hJlsWLKwyRMUVOfzyusrij3khDFZWiU
	LH/hllT0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk7BQ-0007T0-5e; Tue, 01 Dec 2020 15:03:12 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk7BM-0007Qm-BR
 for linux-snps-arc@lists.infradead.org; Tue, 01 Dec 2020 15:03:10 +0000
Received: by mail-io1-xd42.google.com with SMTP id z136so1900875iof.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Dec 2020 07:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Og6g/lyCjIcL1kVP5tZ0QAgJA4aZEi6Vqr/nNvj+z/c=;
 b=MuJqInQZV0OrkCoMCfzib+ByRspfryye7ScpvL1lLH2mX7NIsytrmRxolmgtJ9fehy
 EbBP/aISbDHRpdOD5loNtEUerij2pZmUpMmUXabE4MTbgLqQTGiN1E8/2+XHluf6FGt7
 RX2J4Jg/H1cUlGQdmuUFT6gfHB2UBbkhTCfAwzG5pdvDGhtrcqZz6tB4oxo19nKrQsOu
 jKoANA3VnBqbkAYWC8rpsG34RztYl9VAjQzCZc2EVqsalbS9SdeVQE9rsjul3fuGnFXA
 LEQIXyj9US4vZsCrqyALxiMfO2iSyFmFdxk7I7HJVNQcsSl4LlCsElbVCoxYnRqt17Jm
 y6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Og6g/lyCjIcL1kVP5tZ0QAgJA4aZEi6Vqr/nNvj+z/c=;
 b=fVqSyZ+5KraARdxpJ7nU/pvjEa/DEDeXp5lTFNNGQNL5dLi+TjpXNchkNEJhmQnD8b
 O6neGNRdIRdnHbBXyi+aOrW2kLZBp0Up1BAwKb1RmqAdDGFvu/1CwBerSzzbLUlTu1cI
 unkNiI9LKtiKcJZ4YSpFwCewxxEJAZFaa5Z4M6XUCdadInIPDGSHp/ciSUD0t0D+q5il
 nsaG1g3u603Da5u/ZI0QcOv8adwNyXo9VyIOAog81x4SH1WHOq97zLIj65mFXGHnk+CM
 AByrsk3fYdTGYAZfsHGouF+f6bd0qQQYUYGn+l9XUImPfQAezWIdBbCCSRcB0NrYBLKk
 anqg==
X-Gm-Message-State: AOAM5301EOOfrHcJGpSNBfXfs8HmTBeiklkPqmKhOaZQ1kLr7gqTsDEY
 YF+byPMTXT0bE3f9aAfaPZdnHxKhE4q5xQ==
X-Google-Smtp-Source: ABdhPJwnZnnT3CSvidMrOWY7WttjZ3ON/dA9qpMhE8X0d7c2GzTEq5bmfutQ1PBUEhW9MbRonHjKIw==
X-Received: by 2002:a02:90c6:: with SMTP id c6mr2924306jag.3.1606834985798;
 Tue, 01 Dec 2020 07:03:05 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id h70sm35580iof.31.2020.12.01.07.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:03:04 -0800 (PST)
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
Date: Tue, 1 Dec 2020 08:03:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201135623.GA751215@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_100308_584153_7EF443B3 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/1/20 6:56 AM, Mike Rapoport wrote:
> (added Jens)
> 
> On Tue, Dec 01, 2020 at 01:16:05PM +0100, John Paul Adrian Glaubitz wrote:
>> Hi Mike!
>>
>> On 12/1/20 1:10 PM, Mike Rapoport wrote:
>>> On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
>>>> Hi Mike!
>>>>
>>>> On 12/1/20 11:29 AM, Mike Rapoport wrote: 
>>>>> These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
>>>>> with a mirror at https://github.com/hnaz/linux-mm)
>>>>>
>>>>> I beleive they will be coming in 5.11.
>>>>
>>>> Just pulled from that tree and gave it a try, it actually fails to build:
>>>>
>>>>   LDS     arch/ia64/kernel/vmlinux.lds
>>>>   AS      arch/ia64/kernel/entry.o
>>>> arch/ia64/kernel/entry.S: Assembler messages:
>>>> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
>>>> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
>>>>   GEN     usr/initramfs_data.cpio
>>>> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
>>>> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
>>>> make: *** Waiting for unfinished jobs....
>>>>   CC      init/do_mounts_initrd.o
>>>>   SHIPPED usr/initramfs_inc_data
>>>>   AS      usr/initramfs_data.o
>>>
>>> Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
>>> I'll try to see what could cause this.
>>>
>>> Do you build with defconfig or do you use a custom config?
>>
>> That's with "localmodconfig", see attached configuration file.
> 
> Thanks.
> It seems that the recent addition of TIF_NOTIFY_SIGNAL to ia64 in
> linux-next caused the issue. Can you please try the below patch?

That's a lot of typos in that patch... I wonder why the buildbot hasn't
complained about this. Thanks for fixing this up! I'm going to fold this
into the original to avoid the breakage.

-- 
Jens Axboe


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

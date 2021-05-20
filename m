Return-Path: <SRS0=DFiJ=KP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1C9C433ED
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 May 2021 08:41:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED83461184
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 May 2021 08:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED83461184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q82T1XZq6tGBGwubflIKB7yxCwJk/HTHCBBCEaMggGA=; b=jiZSnsqgW89E4ME3o3VV7hTo0
	WnPtRE+r45npFAX0VSLB0uRgjMKsT0xqlux5j9MaCMaxOpz5lSkwknZXGSJG2qD8eyXk0toYoqSZZ
	w7YtvxGGr8MUeztug1JSaB9ktmK3f+f1eIkxA2yqvY7h9gEkTKPQKoCYdfGuMdCaCm1AaTzCQxto7
	LVa/mhUVadl3hvDw2C/wIQiBNZxkoqyungfOAwRK2x1Yl5MAgLrUWT0VLpRZUQYjdhl9bwGZobvj5
	3K5yJbXArs4/v6X7GgTWpzMJrhm+qQpcOWVkD+WEnZGDebgg97zqUgxvJecnQ6eFJR+XmlCAPPo5V
	nBNGA1GUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljeFV-006Fh3-Ft; Thu, 20 May 2021 08:41:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljeFT-006FgT-5u
 for linux-snps-arc@desiato.infradead.org; Thu, 20 May 2021 08:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=T0ppVreHUmy08BJqE7YgiCmeprMRBFovM1x+vk+Qlok=; b=OTPYnQ0tAxV62lDLRtxtIOzdSb
 2aDS4yQntjvBHd00MdvEnto2ADo+jpVNFLusYf2FuY/7NkBlmbA8gb7M3OLtZ3oorl8hHKZyVIDYj
 ZIZ3PPE7tm90nSimBMkHMvhtUXNiNzNOaaEDNaPTxc7qlMLFr/Y66c8wvd8uFQY2/zkEfY8pS8Bfs
 1LqytBVj3riNtFA0k1Yu6GsWNeOY0HPTC9ZH5fw1u4e1io13gyyG/frSLkZbBv6AoHag63ECOBO1K
 NmXvR0sIJG+ubz6xYkvza5mFiUqOOQUcS1WvrwdpklYta3UDLkAMFLm/WNEyI5ZwGnLWvH+qMeI+a
 mZQCdU1g==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljeFQ-00G4e5-Ml
 for linux-snps-arc@lists.infradead.org; Thu, 20 May 2021 08:41:41 +0000
Received: by mail-ed1-x534.google.com with SMTP id df21so18456972edb.3
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 May 2021 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=T0ppVreHUmy08BJqE7YgiCmeprMRBFovM1x+vk+Qlok=;
 b=uKsuW6gpn2YaYgAkCzYY790rZC+0w1g6JLp3vGbCp20tRC143xr8VQPBmoGKRO1TaJ
 Bg/Bk67InFtMd9Q0IY3+p4vDaNZS1fq5AMKPRu2ivA9vsnHPK6d7QKK5aCPbmom9VDAy
 yezfUzt2tUfBor4kTrvsSCV6ZIgrD+N+f0Le6Ydy9usNFkb9IxVouALlXDG+uzYn2N2y
 3TeOUEZFhD4Hn0Kual/SOiHsvFx1rp85I3QaJq/3DN7+xD0OMfdGSnpK5PVNoIoOSzfq
 4u2zLjpYskcjVau4XiX0xKoCwzwNK5GIALGgoE7r9+uI1c8t9BJ4Yx+h1zHTOKbOOcrn
 0CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=T0ppVreHUmy08BJqE7YgiCmeprMRBFovM1x+vk+Qlok=;
 b=LlgqAlADObk1VXtppBd/TMTgUmBnzhtqJO3ABXeU4kCbzF+qz5r8L2wGMrQ9iixvka
 SJNKviZXiMbecHepFWY/ZWCsYZ2C+gHwRA8DVWS/soTHVMduKOsbTaRP2+SJJ5VCgpKI
 0dyB4XwkYRqck6Usqv4LSXoS4vdoD0Vkq5tfEvZkqO8y/4NWWyNBnSOJttkY8wQr0zND
 bTYeoTLzWoSJA5x+mm/QNPP6YxODjpjPLWeUPROa5fR9E4VJFonwucE5+uKVedkb9T3h
 YRG44tEahHl98fxGFNAYC2ZqQK/oI+1KagOWe6eg41Yg5gCrUluFPwPGMvotlarqKv7+
 i/xw==
X-Gm-Message-State: AOAM530momU73OwOafSjkAbrzcjHVo895971b1cSOlwYdN3jmnldf5eu
 sOUNE2oHeHgMZ9hcybU8Dx4=
X-Google-Smtp-Source: ABdhPJz6NqUn2kc8seV7vWtOJEBIgj5XcEXvh47Ng5BITi8wHAtxe6pFnEynfZ68DLdMtYY4uvHFYQ==
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr3717318edu.359.1621500098966; 
 Thu, 20 May 2021 01:41:38 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q16sm1129848edv.61.2021.05.20.01.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:41:38 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ljeFN-00039M-Qt; Thu, 20 May 2021 10:41:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vineet Gupta via buildroot <buildroot@busybox.net>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [PATCH v3 4/4] lmbench: lat_rpc: fix stray pointer
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-6-vgupta@synopsys.com>
Date: Thu, 20 May 2021 10:41:37 +0200
In-Reply-To: <20210510180049.61421-6-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Mon, 10 May 2021 11:00:49 -0700")
Message-ID: <87y2c9ajb2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_014140_762746_C38BECE6 
X-CRM114-Status: UNSURE (   7.76  )
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

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > | # ./lat_rpc -S localhost
 > | potentially unexpected fatal signal 11.
 > | Path: /lmbench/bin/arc64/lat_rpc
 > | CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
 > | Invalid Read @ 0x00000001 by insn @ 0x2011f110
 > |   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
 > | ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
 > | STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
 > |  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
 > | r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
 > | r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
 > | r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
 > | r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
 > | r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
 > | r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
 > | r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
 > | r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
 > | r24: 0x00000bd0 r25: 0x00000073
 > Segmentation fault

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

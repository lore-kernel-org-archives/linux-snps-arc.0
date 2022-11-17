Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62095C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Nov 2022 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7t8QN3JggEeGbytiFs59DcxijOax9C/a6ry1k6o1xYM=; b=vCG6fyk8YBQiQs
	QRLMUdw/w26wGJP08AW8E/Eg1H9jAeJ8Nwf/PjCBgvP/WS1+BzMehE77gnUo9Nn7U/QbiHwVXW6B4
	woIRivUDhR/KEKB2mSomm6sxixukf9g3k5P85QikMl8sUxDNTs8fxE0LTi+XL/VzWPa0pZWLwgikb
	KZiDoC7a9xxKkRQiHF0cW2cvlYP1ik9RFuhEwsnR9ofXei47WiPk1XmnFuxECcjLAVyY58yGdfJts
	XnL20lHn67yvTObcMUpz6B5qUtHohWjfyv3K8B5Jmjy6Na6gz/Xaq2g/dFwsBZ+p4DyPjFZ12tdD7
	SYrzKIR/PF41ZNLdoEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfpK-00EnNr-Q4; Thu, 17 Nov 2022 14:25:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfoN-00En1Z-23
	for linux-snps-arc@lists.infradead.org; Thu, 17 Nov 2022 14:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668695054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
	b=A15D9BwdGcC0QKAsI4Vi+ceNJY5dOHnos1G2xFrBFxsX+ZKkMPtTc2x69E1YM+x8mvvgs1
	Tko/AK3LXu5Bbmsgjf9OtL8SVvg6viG9DFTrn/S3swCKdV3EeZokaAf0Tj5PUBvHCAGPsz
	xBXT3I75K4EqBE4TqpVx52iIY4ym9Sk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-64RPgP4KPna6U_kutyXTwg-1; Thu, 17 Nov 2022 09:24:11 -0500
X-MC-Unique: 64RPgP4KPna6U_kutyXTwg-1
Received: by mail-wr1-f70.google.com with SMTP id r23-20020adfa157000000b00241bcae980cso183220wrr.7
        for <linux-snps-arc@lists.infradead.org>; Thu, 17 Nov 2022 06:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
        b=u8s2C9ZRTuT7p5CTbMf3OqGbSgmehjLxptrQs1ByAlQc5MEbyijHWlRCGB01ufaqKf
         sQ9Et2+RMdKUrntkSQXjlr+YeFSYUXNWEn8H0cReZT2WEZ0Qtf0zopflpGPRNc7jSP6j
         +oNehh6jAsYBGCnRnswteN0ypH0dUimBgQyOg+6rv3UqnzLsJidQnn5clLjKshY984tK
         zNL3PmDzVpFqSiE6JdQMRdN+4gPhnboFpr69GKUMtTh6CqWy1YQx2/BgCZHrp44sD4fw
         kZxv4t7CH4mrjUlvWeJiQv3zs0PRJEMBPqqGOCcC7H6nxNZpk5rsGDHkYGQXs226h6q5
         rI0w==
X-Gm-Message-State: ANoB5pnX0ZhEPhahsdvm31tL3mFUACvDl3CdkSt0nQqW4LcNTLWnpH/o
	CiFLKjhRrZMnVmEhibft7FEEZ6idnLzBKlMF2pQQNKVLFgt1Dzu/dlM2gTR/s4TvJrdiOBRGv7t
	ZSt65qdcfThmaYu5YpOseQiI2S2fSSqVa
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602443wmj.50.1668695050002;
        Thu, 17 Nov 2022 06:24:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf660kXw1O9nDmBZzBp9eoh92b2B6Bcx05wnz8U6SS8Dy3l/finKWGNWkc/ihpfy4N9vMJHAMQ==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602401wmj.50.1668695049758;
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm1095385wrt.35.2022.11.17.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, Guo Ren
 <guoren@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Juri Lelli
 <juri.lelli@redhat.com>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicholas
 Piggin <npiggin@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH v2 6/8] treewide: Trace IPIs sent via
 smp_send_reschedule()
In-Reply-To: <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-5-vschneid@redhat.com>
 <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
Date: Thu, 17 Nov 2022 14:24:04 +0000
Message-ID: <xhsmhiljdy7zv.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_062415_220310_B22150C6 
X-CRM114-Status: GOOD (  16.43  )
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

On 17/11/22 10:12, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:34PM +0000, Valentin Schneider wrote:
>
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index c4d561cf50d45..44fa4b9b1f46b 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -167,6 +167,14 @@ send_call_function_ipi_mask(const struct cpumask *mask)
>>      arch_send_call_function_ipi_mask(mask);
>>  }
>>
>> +void smp_send_reschedule(int cpu)
>> +{
>> +	/* XXX scheduler_ipi is inline :/ */
>> +	trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
>> +	arch_smp_send_reschedule(cpu);
>> +}
>> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
>
> Yeah, no.. I see some crazy archs do this, but no we're not exporting
> this in generic.

So the list is: ia64, powerpc, riscv
and they all seem to do it because of KVM:
  c4cb768f0277 ("[IA64] export smp_send_reschedule")
  de56a948b918 ("KVM: PPC: Add support for Book3S processors in hypervisor mode")
  d3d7a0ce020e ("RISC-V: Export kernel symbols for kvm")

Other archs get out of it either because their smp_send_reschedule() is
inline (e.g. x86), or because they don't allow building KVM as a module
(e.g. arm64).

If I can cobble the tracepoint+reschedule in an inline helper, then that
wouldn't require any new exports - I'm fighting a bit with the header maze
ATM, but hopefully I can get somewhere with this.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

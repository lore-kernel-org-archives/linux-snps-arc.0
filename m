Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8062EC4332F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Nov 2022 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BZh58cOTzJ+ujMjfnx1iTjIlOL9lx9GMs2NN+EVTKI=; b=dEAaZgstHm89Oa
	itq8WJU4aymkhtWowWNsWATcpqwZ7OtXpyIX21L0H/q9typ66N4zTM6uUoVBwBQbABCh/h7JQqcoS
	2KI/FeuTCLT2jXNNwpelwlnAqpy/AjxgGWYIDzc67UAthP0tQTGzNxWtkBxYZQdjmMWE8BAuNzbWj
	yGsvJC983BFZGgnuNAVEAKOy1wLNwpMMyN7zVrXfhH7gvOvUL1jvQ6LKL0v5FoapdasrxHI1JYaNz
	Y7B/HtlpUAamaw/RGnWIvn52pdeANKwZ6037Rzc9Z+gYA+qp5kgDnRiYrdFLFK0AU3opXcsgC4DWh
	NB8IJ33djEe3nAVvbyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4TU-005RpW-76; Fri, 18 Nov 2022 16:44:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4TR-005RnC-Us
	for linux-snps-arc@lists.infradead.org; Fri, 18 Nov 2022 16:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668789856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
	b=VbfSdjc8niO8VHnUyJrc4oIYlOOqSHan5D/PXpngB/3qba6I+yNvCqnx4RZkYwd0TURjxz
	g7+MClW5+ZCQXcxRQOo/crIwRg3gzH+A5P3ZuI25lyhpYqcVqYHt3Qha/y2WfSGM2z6oH1
	RwFk5Hf8BS76iAYXSZ9uyRP20+rbGWo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-ifRKcFZPOJGzrwVk21dzug-1; Fri, 18 Nov 2022 11:42:38 -0500
X-MC-Unique: ifRKcFZPOJGzrwVk21dzug-1
Received: by mail-ed1-f69.google.com with SMTP id f20-20020a0564021e9400b00461ea0ce17cso3283828edf.16
        for <linux-snps-arc@lists.infradead.org>; Fri, 18 Nov 2022 08:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCeupirs0oRwfAYdrtKDNR33oxtw0kRHF9WhmcxURbs=;
        b=cfVAK44pESZs2xA5AqTT56Dk5jJMi0nF/WHIWZqYSaw9bsMO9f4vO5FpxwT9u8OwBn
         zkqPhXyZTDrLzY2i0FEvE7fJHCkK5ivOaiW33YV4UWNItLs3H46QWEtCi5oRdSPLsR6o
         DwqEYqovTS3dq7K4ZSG0pvj3b+v3eU9j0/ZG0ZknTSslH4abNq0an3W+XwGdp4IsRDm5
         A12XigK/EMMwaOmpOv/g37MF9e+M1YZQfw0mqR9rimo1mL0alfm3AG8ZNDylS8QDhM6U
         wBDf9gKUlDUiLc4pcrlfpZBzKjtmh/aPYSGiZcrNjLQnSQct7hM9PW6kdn8ZxeByRTOR
         RLnQ==
X-Gm-Message-State: ANoB5pnAbMi4UoEiqoOMN7TkYYRKWr+m5RGa3Oa0ND28ttc7WpZioLwu
	ZtbEB4SAjU7wNAIOQ+DFpi/eaaSEPqPYhI02+VKd7Yo/zdx51Qdj/WwxnhNePeBZX/L/rLklbo2
	en0RAyKbhJXeBGTLvVTRi30U9ROZcht9v
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997412edr.201.1668789757505;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5TaV9WywAgyEkJUjIKk83rbFXBQR8khfDHnlKNNSiUU8k8aohx0CjQn5lly7hEq5+W3BWrVw==
X-Received: by 2002:aa7:d4cf:0:b0:461:a9ce:5408 with SMTP id t15-20020aa7d4cf000000b00461a9ce5408mr6997376edr.201.1668789757207;
        Fri, 18 Nov 2022 08:42:37 -0800 (PST)
Received: from [192.168.0.46] (host-95-248-159-81.retail.telecomitalia.it. [95.248.159.81])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b0073d83f80b05sm1912134ejh.94.2022.11.18.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 08:42:36 -0800 (PST)
Message-ID: <1ab5082c-bec5-53f2-501b-f15f7e8edbd9@redhat.com>
Date: Fri, 18 Nov 2022 17:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
To: Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
 <xhsmhfsehy706.mognet@vschneid.remote.csb>
 <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <Y3dMiyFn6TG1s5g3@hirez.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_084418_101880_C76664F9 
X-CRM114-Status: GOOD (  14.16  )
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

On 11/18/22 10:12, Peter Zijlstra wrote:
> On Thu, Nov 17, 2022 at 02:45:29PM +0000, Valentin Schneider wrote:
> 
>>> +	if (trace_ipi_send_cpumask_enabled()) {
>>> +		call_single_data_t *csd;
>>> +		smp_call_func_t func;
>>> +
>>> +		csd = container_of(node, call_single_data_t, node.llist);
>>> +
>>> +		func = sched_ttwu_pending;
>>> +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
>>> +			func = csd->func;
>>> +
>>> +		if (raw_smp_call_single_queue(cpu, node))
>>> +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);
>> So I went with the tracepoint being placed *before* the actual IPI gets
>> sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
>> e.g. trace_call_function_single_entry().
>>
>> Packaging the call_single_queue logic makes the code less horrible, but it
>> does mix up the event ordering...
> Keeps em sharp ;-)
> 

Having the trace before the IPI avoids the (non ideal) case where the trace stops because of
an IPI execution before we have trace about who sent it... :-(.

-- Daniel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

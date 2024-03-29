Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55165CD1283
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 Mar 2024 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEwf4Jmw9etIIkxDLicMkLAMgRMM10iW07rc55IwjVQ=; b=fVVoDNXKmjKWP+
	JWiPIznBtDoKXq1+ngk3/u6lBuz7GMNu+bk9U5k6LemRXctitxa5/zjzqhOxWbUQE5yT98txIXr19
	ZqCX4ix+7aTYfoKuHBzXBvzW90XRoJn1IqDV3LJcpA+RMMbiX9Xz3uwselUJmfHtBFPGWSB60nQWJ
	JNpk8pK9g17HCELwe5b27wNCfHLk4+HMH/XvfBf6JPQKqu5mV3e4zcAvzjza4Dp282D9BE7BpoUTO
	RmDVz9g3rU5OG5D4AnIDF4YEJoSmbrRiiQIHyiDBmmGSnlYvcMQvhdWOwnRufhljK14a9HTaNDcm7
	p89yuq8fEc2LYE+JozBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHsT-00000001lJr-30hc;
	Fri, 29 Mar 2024 19:27:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqHsQ-00000001lId-3YPj
	for linux-snps-arc@lists.infradead.org;
	Fri, 29 Mar 2024 19:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 548A4CE30B5;
	Fri, 29 Mar 2024 19:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5286BC433F1;
	Fri, 29 Mar 2024 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711740414;
	bh=QDSHyVvXwKqJ8O8bqyywWUeosVF+l6dokYgeu6N4UH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XQf0mqXw49r8j2ILb2jf5mExVoi+CZkPYc/7R8h+61A/gYVZ39lKKuaLCHgpylgpE
	 B7YLDobP8kCuOq4zS+A3atDTTQaGJ3rK+ACzDVRszgNn1Q04cryzTP/xtYF5aFZ2fg
	 /q9pta5LLfrs8NW/Vuzc0a5sVzTLAZ1iq8M4Uir/jeJmmm/gs/mrYqohVhG/YaW64y
	 5OB1imo24mycE0JIwKAo2OObRKbDPA8gKXAtYu+CpPIXKHjJxfBEl2ZIjYM5YVKQ1I
	 WdZvvoLKejjzU1Lnjvr0Mgnr1rrap2VreKtwBzPfu4plJhhwDZVgewr33AXpNojWcZ
	 Ic3r3pDfB6Ptg==
Message-ID: <e5bacec0-28ca-4cd9-9ffe-92feaf5fbfef@kernel.org>
Date: Fri, 29 Mar 2024 12:26:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] ARC: Fix typos
To: Bjorn Helgaas <helgaas@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-snps-arc@lists.infradead.org
References: <20240104190247.GA1823635@bhelgaas>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20240104190247.GA1823635@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_122659_279884_C6054C59 
X-CRM114-Status: GOOD (  13.54  )
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



On 1/4/24 11:02, Bjorn Helgaas wrote:
>>> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
>>> index 0b3bb529d246..5414d9f5c40c 100644
>>> --- a/arch/arc/kernel/signal.c
>>> +++ b/arch/arc/kernel/signal.c
>>> @@ -9,7 +9,7 @@
>>>   * vineetg: Nov 2009 (Everything needed for TIF_RESTORE_SIGMASK)
>>>   *  -do_signal() supports TIF_RESTORE_SIGMASK
>>>   *  -do_signal() no loner needs oldset, required by OLD sys_sigsuspend
>>> - *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implemen
>>> + *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implement
>>                               
> Thanks again.
>
> Added these and a couple other ones to my local copy in case there's a
> v2:

Sorry this slipped thru cracks. I don't see it upstream and given some
pending fixes for Linus can pick this up.
So I take v1 + the fixlet below or do you have any more local changes
and prefer respin/resending ?

Thx,
-Vineet

>
> diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
> index f8f85c04d7a8..8ebec1b21d24 100644
> --- a/arch/arc/include/asm/pgtable-bits-arcv2.h
> +++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
> @@ -66,7 +66,7 @@
>   * Other rules which cause the divergence from 1:1 mapping
>   *
>   *  1. Although ARC700 can do exclusive execute/write protection (meaning R
> - *     can be tracked independent of X/W unlike some other CPUs), still to
> + *     can be tracked independently of X/W unlike some other CPUs), still to
>   *     keep things consistent with other archs:
>   *      -Write implies Read:   W => R
>   *      -Execute implies Read: X => R
> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> index 5414d9f5c40c..3490d005e6d4 100644
> --- a/arch/arc/kernel/signal.c
> +++ b/arch/arc/kernel/signal.c
> @@ -8,15 +8,16 @@
>   *
>   * vineetg: Nov 2009 (Everything needed for TIF_RESTORE_SIGMASK)
>   *  -do_signal() supports TIF_RESTORE_SIGMASK
> - *  -do_signal() no loner needs oldset, required by OLD sys_sigsuspend
> - *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implement
> + *  -do_signal() no longer needs oldset, required by OLD sys_sigsuspend
> + *  -sys_rt_sigsuspend() now comes from generic code, so discard arch
> + *   implementation
>   *  -sys_sigsuspend() no longer needs to fudge ptregs, hence that arg removed
>   *  -sys_sigsuspend() no longer loops for do_signal(), sets TIF_xxx and leaves
>   *   the job to do_signal()
>   *
>   * vineetg: July 2009
>   *  -Modified Code to support the uClibc provided userland sigreturn stub
> - *   to avoid kernel synthesing it on user stack at runtime, costing TLB
> + *   to avoid kernel synthesizing it on user stack at runtime, costing TLB
>   *   probes and Cache line flushes.
>   *
>   * vineetg: July 2009


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B03C4361B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 16:08:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B749207A9
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 16:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B749207A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6fsic7H/nT2EKNsniiepxpxk9nJW7Kaa0VpcjHFsWn8=; b=twOK0mD5zMLA+iXJEoplqg0YF
	8fiC4iV7NiXJ4uQvs+7z9hkZun++6MaqKa45tr9swmxrUukSJFKEqtcehomfPEmhNcQV3rQ8BRMw9
	SK8QQOqIBxxOCEKHC4szYiBJHGtXokYSLlxQcZsbuLhtdfs2basC6J7ttcT7sj7tPERxfMoI/xhD6
	0JVGD2rpex+U/IoGzfSJhNRJ+GfLo3/kBNi1HTRXDpu2LupjZ4c+RrOZO6AfYXzuMX5B4Fwqb1dkr
	DRayaPbGoW0LGpV3DeTOSaRw1EQoDFkkGvZKHXclrY1zIDmA48toLBiTcZ/qmnB+R7haNCnp+1X0v
	wfRO+YGvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkr9R-0004LW-GW; Thu, 03 Dec 2020 16:08:13 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkr9N-0004Jp-Rh
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 16:08:11 +0000
Received: by mail-oi1-x244.google.com with SMTP id h3so2685443oie.8
 for <linux-snps-arc@lists.infradead.org>; Thu, 03 Dec 2020 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ST3vVZbTZBZTabxx9VqYJCrpfIwlt1a4iVUUdQqEy1U=;
 b=pLREjRpZ++zlPM/OjFFHnMidjrTU8bpHZvNf+QqvRcPyGCJReJ03XbJImrGF45GTNF
 D7c7ZWlRds1LJUpxS9Gj80eJvqeY6Zu9qfPZylPKLZLD3KIAvOdZpV/wRn4rd2tP9mcF
 oSQfH+ST2S2YMLHPfWVwkKNQ0U6GNKwh4xxBjP0frKZ5NdBa+hMde5CtU058VmB2w+Qq
 25vbpgQUx+lfPPTmyjc2Vi37iXDuWrVd8OdEAE3a/GaRmsfI+tuO+6dCnszBLClFrHoj
 BPSjqu0W7y9yWDUcUo4RQ1vOXdO2k7PFKf7+HnLMKVVEb+QbrmerQ185n/4lZQXTsPoM
 +dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ST3vVZbTZBZTabxx9VqYJCrpfIwlt1a4iVUUdQqEy1U=;
 b=ewbETpArmR5MwxGigDAWdq2cCilrSWry5xkYDteL3kta2VSB6Qm0RNTSn4ckW5DzEB
 OV0RrLqAWclAF4ZaQsOowlvy0S8s/APnY3767sdqYxjXUYu+V6ih4wxy8RC5MPKHaheK
 oKy0JNimlpykYyRXdgtULFtj01tme8LMSDrxRITXNVX75wh27Sn5b2qu75/f5qYTPewj
 gsNzwj7QMzJ900JQus7twL3LQnghJVl02r9KN69r9kfc29VlL35EVpVDy2k1y7lS2Mzq
 ZP8wGtY09DNpzVi38lHNCe+h9/mFIEpIBAJ8xueSLr6/CHcRfjszLej75EcOfK6uqJqm
 hf1g==
X-Gm-Message-State: AOAM531+sZslvPJa2B2ATRl4tUyYGIM4T5ei7ixkrHKClRLbWkhOt9g/
 24olibkl6Z6rrbrunxdtK3STqA==
X-Google-Smtp-Source: ABdhPJwCWUUcMm3kUGi8IpedtsHQSSxeiKcmQARsv7SaGWkvFiIvJ0JvGmsvBUQOo+/DuhiN4Un/lw==
X-Received: by 2002:aca:3145:: with SMTP id x66mr2289207oix.29.1607011685574; 
 Thu, 03 Dec 2020 08:08:05 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r19sm317165ota.14.2020.12.03.08.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:08:04 -0800 (PST)
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Cupertino Miranda <cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
Date: Thu, 3 Dec 2020 10:07:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_110810_206559_C07A2897 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/2/20 6:55 AM, Cupertino Miranda wrote:
> I totally understand your concerns with generated code.
> 
> To explain our decision, we have an internal database that we are able
> to describe the architecture and map encoding with hw semantics, and
> for the sake of saving us debug time generating each and every
> instruction, we use it to generate both the TCG and instruction
> decoding tables that you have already reviewed.
> This tool is not only used in QEmu but through all our tools code,
> allowing us to cross validate the content of the database.
> 
> Considering our situation and current state of the port, what would
> you think is a reasonable compromise?

In some respects you're in the same situation as the hexagon target that's
currently in flight on the list -- both of you are wanting to generate tcg from
a company-specific canonical source.

In the case of hexagon, the target/hexagon/imported/ subdirectory contains a
bunch of stuff exported from Qualcomm's specification.  It's not fantastically
readable, but it's not bad.  These files are then massaged in various ways to
produce either (1) out-of-line helpers or (2) inline tcg stuff.

Without knowing what form the Synopsys database takes, how easy would it be to
export something mostly human-readable, which could then be processed by a tool
that is included in the qemu source?

Future qemu maintainence is thus on the tool, and not on the auto-generated
code.  There's also clear separation on what needs tcg review and what's simply
a spec update.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

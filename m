Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD7C64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 20:23:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3960206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 20:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ey9WTSDt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZK0PUUSg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3960206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oP/CJRK2qtYMP1Z1ohTCU/OO0YfQC8V2WfAaeWw7rxw=; b=ey9WTSDtWsPAcKesUu9Ybn/l2
	gKKY/iwhpj9COFqYC/FVFNbyCbroWpUXZrs6w/+4R/0QfgoERrOH4IcHm7iXp2wmtswlmdy9U8X3H
	zceQkqei99TH468F4lsXYVcChJu//vvGBgzREmf19jmPxPSptP/BQCg6/6FDosEc8EosG3+jsb82h
	ufY0X0Z8fbsju9jC3nJqSUyBUM0e0pv/q5ZAk2/DjfrlHhR41Em+T8KkWT0QoUt6iAzhkESxWYxkd
	kIR0nn8j0HUMmwKYAXlSmrcTV1f7CV/JNZPjxMDGR1C5DZwsBEubL3dwCSl6l6pG3QWQ+ryMbqnju
	TRvPH/ZCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCAy-0005eM-3z; Tue, 01 Dec 2020 20:23:04 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCAt-0005dy-Ro
 for linux-snps-arc@lists.infradead.org; Tue, 01 Dec 2020 20:23:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id h3so3185840oie.8
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Dec 2020 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZnOR1qpIQFJ8LMTqPc892N5j/RToq6UueO7kaxqvTo=;
 b=ZK0PUUSgQW0AW2X+OF9MEVUN80UBbH6ycQoma5gUj+QHTEfOpPj9BgIXCROQGP6Xu3
 yJmtEqXvJQ7yySJxfM6vE5NvmoWg9mCSZ9N/R/Bgnif/6ZPObAyfoqM/jEgudsrW4uIE
 uzjDc9K8eVcGegV8aLTDAK2+2VnXRVdBCt7+2PJOafntcL6tw7yjDlXLOG686vKWqFOC
 qEc3bUpFyJ4qDpRLwJjF07xbHSQt7Q73VOvtTdyeEXY9E2wS/d0eWlTj4N9PIOUxp/cg
 9nFQvkanYR5sdzkuM44YNDVqAua49R367DhubWz1tLPtcPkaxnjlRC0EkwKtazopVR90
 rj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZnOR1qpIQFJ8LMTqPc892N5j/RToq6UueO7kaxqvTo=;
 b=tc8RLLb+IWo2ranNk/Fxbk1eoDW0HomsIb6T79HRLhvq1KoJqzfm77L4xel65CIU8z
 PvX5H1NdMSODbdmh4JCrGS+Ivw50jaX2t2X/AM22YT8qXwYuGMLopok7K0iDl701TcD9
 cu+4TL3SQRZ4CEnI7k88cA716xCshrJ6ESUzKfGBaLMZSunrmsbWiU2ceg/T1bjtVdn4
 srGbKqKthCgayUyc3Cwot0dWca/VFWjPOdSD9fEC10U1MlbMDyZA4Yjm5pAFTtsBBfyU
 QYRw2xgZMPvNcrgJ8EvaluH/6RuKeqiNXnaO2M/Sfke4TgLPm03kOTN0S5iRyxD5b8fv
 KKPA==
X-Gm-Message-State: AOAM533bZTWoUFWboj38EohVwRDxB9LgfL47BqO79a7uikuV2x+FanPI
 YlgfsuJt5xS7qignMKwjQXL/sjUQWOVsTwvM
X-Google-Smtp-Source: ABdhPJwUMmIkc0WB+LVWi8BVHyQc6PiHX6SV96UFHNoEEQINhrpKT8mqz3ljnXnWxevNgoh+kxgQNA==
X-Received: by 2002:aca:f1c3:: with SMTP id p186mr3026445oih.154.1606854177499; 
 Tue, 01 Dec 2020 12:22:57 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j46sm194173oof.36.2020.12.01.12.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 12:22:56 -0800 (PST)
Subject: Re: [PATCH 03/15] arc: Opcode definitions table
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-4-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
Date: Tue, 1 Dec 2020 14:22:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-4-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_152300_766005_17B390F7 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
> From: Claudiu Zissulescu <claziss@synopsys.com>
> 
> Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> ---
>  target/arc/opcodes.def | 19976 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 19976 insertions(+)
>  create mode 100644 target/arc/opcodes.def

OMG.  20k lines.

I assume this is gnu binutils opcodes/arc-tbl.h?

You are the contributor there, so a re-license is fine.  It would be good to
document the upstream location and revision, against some future re-sync.

That said, this format is less than ideal:

> +/* abs<.f> b,c 00100bbb00101111FBBBCCCCCC001001.  */
> +{ "abs", 0x202F0009, 0xF8FF003F, ARC_OPCODE_ARC600 | ARC_OPCODE_ARC700 | ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS, ARITH, NONE, { OPERAND_RB, OPERAND_RC }, { C_F }},

You've got the same information in two places
(00100bbb00101111FBBBCCCCCC001001) vs (0x202F0009, 0xF8FF003F, OPERAND_*).
Moreover, "abs" as a string is not especially useful, and means that you have
to deal with strings in the translator instead of C symbols or enumerators.

It would be relatively easy to generate a decodetree file from this input,
which would simplify the translator.

At a bare minimum strip the quotes and wrap in a macro so that you can (1)
define an enumerator and (2) put the entries into an array indexed by the
enumerator.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

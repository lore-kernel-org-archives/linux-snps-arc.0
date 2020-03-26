Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932FCC43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 03:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D9C20772
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 03:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qn+Xd1mG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKR1BoHe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D9C20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK/RSgBewzk3xt9h9fvyxMK+GEqcdSHiBEh3PG63uUE=; b=Qn+Xd1mGi6eWeg
	7uJN7ZKmpusp7Mj77RdkWH8pBXanr5Hsp3Dc4uyQYVMeWMBXmaPejuVFtieEhvL12mbyFWB7aAb80
	gGFqvBFggeiklsXatbcRh9J091dwhlqA318BXgYGv9p+ej5KuZdcsLeOrOhwEYL1srX2eNElKchVs
	E10Nkg6ncN5ZtW4+aHAa8LFZHg3OUmv4QdUmtqThUQDrADO+W0mtp94jo6JupZHe7wTqS0YTddJFr
	M3pUbVv8p3UxQHGH9W2S1kPjsX6JNDqAeEwzf1EieO3aZeT6lxjgp08eBvF7iXiFjtFfKqvUOEDO1
	OqzfGZR4+SWG1yUm0zxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHJ3K-0002YT-SG; Thu, 26 Mar 2020 03:19:30 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHJ3I-0002XD-JK
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 03:19:29 +0000
Received: by mail-pj1-x1044.google.com with SMTP id o12so1852009pjs.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 25 Mar 2020 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GOSy5+PIACtqzxmtM41Zc00Bl+dFeIniq7nMnBTrz1U=;
 b=pKR1BoHesOiUTHaTtlMduTYdVTeXciD28A5fDQ7iZxGfJwbg6GABRdYDUT+E9BAxp0
 E+5+TVcoa2SK+NNsSExJCGsZmkoA2s+spv0YPZOUMbZD0B6JZYHLp5XqYPYkp2WCpHo3
 QXnh2mTDQQ8NmlsZEFygGytOInJ+HI4oY3W+PxDEFtMURnPitywOfMoSbeKLIbnipyxD
 CIxx9Xen/89wtbPNdls6uEHFEfxdWwD5N+FweDMdkm2N/5AMaIueyvTyfB6+ybqAcTLG
 Z6+05boe2QvNKaNoLBCZwsr07LerfwGTeKFoA8rWeca9xgKKYPTA44xX9nAwe256wM+V
 PkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GOSy5+PIACtqzxmtM41Zc00Bl+dFeIniq7nMnBTrz1U=;
 b=r+0KCqbhntjElva89lTURbVcb+m1Q2F0iZbs47A6ifLmCc0B5r9MDEgE0j6YGKNb0Y
 Yqu1gscJCvkXOAXYGIU02aYGzjeLunh/bSzWPxDvP12qprd+hbsFZ2IRpKEc03iOGaWB
 7xBxX7wMCrv7yCS1jxCBm3bwdzyv+q5D+rx9pGTIBH+TGUfQrZIO2zFo07xybGF4Kd6O
 pM+taeVdVN1URcF5PHDoap/pLsiEtoEaXFunDLth5C9PYcAXxi0SxhjZR26XIu6TnA7e
 GajCQaRD8jLDr+t9JlOztBZIsbe/cIPulvI3fcfKNJWI0q+M9knE5NV85yr7N7BU0jut
 3KUg==
X-Gm-Message-State: ANhLgQ3+FW1ZW7dYxiCi8lpCkhf7nuKMVYeBD+DIek+JpNRFdJx74WhL
 7+VlFI3wAWgEFVhog2d3bio=
X-Google-Smtp-Source: ADFU+vsyM4DpRXEy7XDRa+KaipbVVbYSsPLIHHcc2eQVIvgvLNo1UpI1fwt8Gxg5KThAdw/nnkWvpQ==
X-Received: by 2002:a17:90a:304:: with SMTP id 4mr831280pje.28.1585192767628; 
 Wed, 25 Mar 2020 20:19:27 -0700 (PDT)
Received: from ?IPv6:2601:641:c100:83a0:24c5:8a14:3f19:e6c8?
 ([2601:641:c100:83a0:24c5:8a14:3f19:e6c8])
 by smtp.gmail.com with ESMTPSA id o5sm426551pgm.70.2020.03.25.20.19.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 20:19:26 -0700 (PDT)
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
To: Joseph Myers <joseph@codesourcery.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260201510.31593@digraph.polyomino.org.uk>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <2fdc9bab-21db-528b-034c-0d52e2e9b960@gmail.com>
Date: Wed, 25 Mar 2020 20:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003260201510.31593@digraph.polyomino.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_201928_658243_9861DB3E 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/25/20 7:06 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
> 
> This is another example of one patch fixing up another.  You're using the 
> same ABI for both hard and soft float, so the first patch adding a 
> bits/fenv.h header should be using that ABI for fenv_t, rather than one 
> patch adding it with one ABI then a subsequent patch changing the 
> definition of that type.

Sorry about that. Indeed its a different mindset how we things do in glibc and I'm
learning that slowly. I've fixed soft-float so this file is not touched anymore
for hard-float.

>> diff --git a/sysdeps/arc/fpu/libm-test-ulps b/sysdeps/arc/fpu/libm-test-ulps
> 
> This will need updating for the recent changes to remove separate inline 
> function testing (so there should be no ifloat or idouble entries any 
> more).

OK. FWIW I'm counting on Alistair's 64-bit stuff (and his frequent rebases) to be
able to pick up latest upstream and then do the adjustments in ARC port. His
changes seem rock solid in my ARC testing and I was hoping they get merged sooner.


>> diff --git a/sysdeps/arc/tininess.h b/sysdeps/arc/tininess.h
>> new file mode 100644
>> index 000000000000..1db37790f881
>> --- /dev/null
>> +++ b/sysdeps/arc/tininess.h
>> @@ -0,0 +1 @@
>> +#define TININESS_AFTER_ROUNDING	1
> 
> In the soft-float patch you define _FP_TININESS_AFTER_ROUNDING to 0.  
> Formally it doesn't really matter since you aren't supporting exceptions 
> for soft-float anyway.  But typically I'd expect the definition of 
> _FP_TININESS_AFTER_ROUNDING, on architecture with support for both hard 
> and soft float, to match the architecture's rule for tininess detection 
> for hard-float.

OK I've updated soft-float.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

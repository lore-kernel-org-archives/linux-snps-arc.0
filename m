Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0523C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F0520714
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+nqwkJF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOdWJkyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F0520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34YruJk/Um2tRtW+d8VPaCc+HvG8uypaYTzBw5NrqSQ=; b=A+nqwkJFfv/PBh
	n3TZEpEvh22E0vD7PitH2ofAnTMjjicnBynTWjiLHXMC0Nb6kmCxiWKxv5gCtV4RxqHQ8Oqylqr0r
	Zn3Wjecbzt1a1/B2BO8Gb6/LbcYRjsVQIhzEdO/eXEQKMqkOAaJtCPbcIpAxJ4T8CygIc4KhQJ7OL
	8kaRg+k1jdrnIQjpFqYAlbR7v7vMQ4lzZ/RpydLEV3w9iCL2qAZ7Fn4yXatyGjkkS3vZhyVhgfcPG
	/F9TMkQSpY8tt7O6XNsEUNF5hdIYTF3daSK1YbJ1Q+W+nhGthHG+2onS6MBPbbZseqo7KejTtTpn2
	1fSTuHRAwrahpwGtcMUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHIRA-0006Ae-Rf; Thu, 26 Mar 2020 02:40:04 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHIR4-0005ob-VS
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 02:40:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id j10so2022277pfi.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 25 Mar 2020 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8kDUkoJavIyeuZQz6nDvGSb+5SnyQwPZeqxawk/jqqg=;
 b=AOdWJkyAEdB+FiQxGYxGUchl78cYj7dMRvQxxqzbb8/zuVTjWlLV2LhQdZuBi4xVMM
 Ybc/VUTMBDtXMn0HufvJD4igZ3qjWQDS1Rcy42JH6CNm871582xqzOfwffjne8c2i452
 DWt2jxSFrNLrhRfOJuUnTWo2YxImL50xkTkZACVDKaZ/ZtjbhpIRUJS4CUHZuxmnCjLJ
 V8S4LYLNBiSE4t2WrcuPOLit618rFIX/v9i9D8AxLJmc1KQadwCHjntcSi8aozhrIiKf
 3mgmu9V91mTJ8zUYRR+J2xNC7v5OxDzAkpHAbiZ2F6nKVim0r05miH7sxbxMFgN33lph
 7Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8kDUkoJavIyeuZQz6nDvGSb+5SnyQwPZeqxawk/jqqg=;
 b=LOvJQAG5NfiyP7YAwqNyCjf08f/pdNfqn6wR0hRy1vBaWhoNHR3aDQIUCs79plpzXN
 yaMc6TPigazKHL6n3OLlosUbC3waFnSDAxDJoQD9rTEgXXUlPh091DJQZclqMUHSDqMi
 lRSTswu5I0duk9UZ5MjNGP6bgaRgy+aYkn3hFyyfrDp4ULICyBMFC6WFXdQSv48dExvs
 GL2eYJX3WEWbIHJzjX5ghHrgZi373OT1HEMXAR3uFMYLNZ0sPmVBfyH86tKlvB38OWpe
 gliraSLIrcTyj9Fvo+2B2b230WgeL4pD1kAX1ILHxryl1lBIc0HYXZIXqPfRggOfIuy3
 8e/Q==
X-Gm-Message-State: ANhLgQ3CSglGbDtlBe4PCikKDIqLOhFn7knTL6RvyDRYMtrrKS/8yuiA
 dCBR0RUL3vr7v6FNJnqJKWe7kDCzGYo=
X-Google-Smtp-Source: ADFU+vvuAwkC4LKfL3WYVTYWjvohoKhpAckq2QToq0/4qnHw47ceuTHf6Fx6iJg8rwNlneDt2JuXSQ==
X-Received: by 2002:a62:b613:: with SMTP id j19mr6865772pff.90.1585190398081; 
 Wed, 25 Mar 2020 19:39:58 -0700 (PDT)
Received: from ?IPv6:2601:641:c100:83a0:24c5:8a14:3f19:e6c8?
 ([2601:641:c100:83a0:24c5:8a14:3f19:e6c8])
 by smtp.gmail.com with ESMTPSA id q185sm404813pfb.154.2020.03.25.19.39.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 19:39:57 -0700 (PDT)
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
To: Joseph Myers <joseph@codesourcery.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
Date: Wed, 25 Mar 2020 19:39:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_193959_042485_F18EDC4D 
X-CRM114-Status: GOOD (  22.74  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/25/20 6:52 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
>> +/* ARC has selectable endianness.  */
>> +#ifdef __BIG_ENDIAN__
>> +# define __BYTE_ORDER __BIG_ENDIAN
>> +#else
>> +# define __BYTE_ORDER __LITTLE_ENDIAN
>> +#endif
> 
> Elsewhere you say the port is little-endian only.  In such cases we 
> generally have an error somewhere if you attempt to build glibc for the 
> other endianness, to avoid an other-endian configuration accidentally 
> building but not working and having a broken ABI.  For example, see what 
> Nios II does: sysdeps/nios2/bits/endianness.h handles both endiannesses, 
> but sysdeps/nios2/configure.ac produces an error for big-endian.

Hardware-wise, ARC can be configured to be LE or BE and software supports that
(cfr Linux or uClibc). The initial glibc port was only aiming LE but we ended up
with BE as well due to a customer engagement. And given much of ARC port is
currently generic (minimal asm), no real change was needed except enabling it in
this header. We do plan to officially support it so I guess we need some more
changes in Documentation / ABI listing etc.

> 
>> +/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
>> +   address of corresponding .rela.plt entry.  */
>> +
>> +#ifdef __A7__
>> +# define ARC_PLT_SIZE	12
>> +#else
>> +# define ARC_PLT_SIZE	16
>> +#endif
> 
> Is this some sort of ABI difference between two incompatible ABIs?  (The 
> ABI document you pointed to only seems to mention 12-byte PLT entries.)

Right, we've had 2 ARC ISA: current generation ARCv2 (basis for HS3x and HS4x
processors) and the older ARCompact (ARC700 cores which run Linux and still
supported e.g. in Mellanox NPS cores). From instruction set pov they are very
similar (although not binary compatible).

ARCompact PLT entry is 12 bytes
    b18c:	ld    r12,[pcl,0x00065584]	#8
    b194:	j_s.d [r12]			#2
    b196:	mov_s r12,pcl			#2

ARCv2 prohibits--> mov_s with PCL and thus we have
    b18c:	ld    r12,[pcl,0x00065584]	#8
    b194:	j.d   [r12]			#4
    b198:	mov   r12,pcl			#4

Again this is the only change needed for *testing* a ARCompact build as rest is
all taken care by how gcc is configured etc (and generates __A7__). This has also
been tested and boots Linux fine. We can add the necessary elaborations for
supporting it officially.

>> +#define reloc_index						\
>> +({								\
>> +  unsigned long int plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
>> +  unsigned long int pltn = reloc_arg;				\
>> +  /* Exclude PL0 and PLT1.  */					\
> 
> Should PL0 be PLT0 here?

Fixed.

>> +  unsigned long int idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\
> 
> Missing spaces around '/'.

Fixed.

> 
>> diff --git a/sysdeps/arc/gmp-mparam.h b/sysdeps/arc/gmp-mparam.h
>> new file mode 100644

[snip...]

>> +
>> +#define IEEE_DOUBLE_BIG_ENDIAN 0
> 
> Plenty of architectures that have, or support, little-endian floating 
> point do not have gmp-mparam.h at all.  IEEE_DOUBLE_BIG_ENDIAN is only 
> used to define union ieee_double_extract, which is nowhere used in glibc.  
> So I don't think you need this header at all 

Removed now.

(and it shows up the scope
> for a more general cleanup possible for other ports, I suspect only the 
> x32 and mips64 versions of this header, the ones that define 
> _LONG_LONG_LIMB for ILP32 configurations with 64-bit registers, are the 
> only non-generic ones that do anything useful - but you don't need to do 
> that cleanup).

Thx for taking a look.

-Vineet



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

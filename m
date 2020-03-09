Return-Path: <SRS0=xbkY=42=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D6DC10F25
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Mar 2020 23:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA1C24654
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Mar 2020 23:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lb6b2CFu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1cbu7rr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA1C24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE252SLOajW2ow8hE/mI8LCN9MXpkpixhw+dK/5/rP0=; b=Lb6b2CFuvCJ0YT
	HbD0IUYIiATLIQBvK0JXSBf9TqdXg18LwiNoo3g9yZLRlTToW2SNcXLOZvSfDBT4xH9k7g1JDcM+Z
	pipV1hrwdzre9IHkBUoGeN3WWOXg57COa3MP7WFnssGYr6ybvbyBLHZmmSi7orwycfh5ovBT2e2Oz
	sHHGDd1BbFHFBTcHQUYK/43qWlPjuOlawHQwbvaTW4TNeenz+xE3fA0T3meIZSAHoLRgx/VpQyv9g
	p3yfkCD3SW3TSqVi7JQXjcVBdF+imH+0P+5JXPEOhpGrfRakWS+V0PQbaa87kFhk/rXo+BMsH5Ewt
	EeoOqrjNoKc5BoOXL5Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBRz6-00011G-Kp; Mon, 09 Mar 2020 23:38:56 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBRz3-0000rb-LQ
 for linux-snps-arc@lists.infradead.org; Mon, 09 Mar 2020 23:38:54 +0000
Received: by mail-pj1-x1041.google.com with SMTP id o21so445403pjs.0
 for <linux-snps-arc@lists.infradead.org>; Mon, 09 Mar 2020 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5cOBNSFppdUrT8ERyhYEW2Cs7Ouuulef1rcft8Rl9j0=;
 b=q1cbu7rrNtIh/w/RIcqpRvqjbWGH6CEQpYOMdNY+MqFNV/GCoHnJtWsD462IIDR7L5
 mjrYPJQOxGUATb/YGtOcDKJuVnIByQXhB8SOpsB7d4Uz/Lie3TKc1GyqtTSuI1xy5jfc
 nIvbYdoVdHMC8xDN8E+xHMxZ4rEG/6rtuS/Ju3rsHAY+K8+TQMcoqFYZYOny7s/U8cwI
 WTYIBs0aDSzuc2nZHfVmSx30T7t4iRSEghaUdt8Qdj6IEQQTC/tTOz0EZ/RSKpWdsU/v
 vL+2yR8qSbFa9FIuZss1jc98dHeL2qEqvUP/p/tLH8jAuxGIjYWSlgh3+iioY9WTDrbw
 Wb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5cOBNSFppdUrT8ERyhYEW2Cs7Ouuulef1rcft8Rl9j0=;
 b=K/rHphbTKtMmBfKB7g0UZxlif/RXk8Cn6iMTSaRWtynaD8xrH9yVKEGSyUTbZ8xe5o
 9AmwqBk2v1msH9RcxkDb3ga/DmoZ6jm0fyN8x0nb40PXCyQgsqfAoFBzDzDZD7AakVGR
 Zc6zQ7Iy9q9Pg9TtZLZhdA5t90ToL3dJuVj1I+8LfFqA0FDIVIx7zN9C94RToERRHnEw
 2NwI7OIc2GRlT6f0103KYFkMjrd8kJZnR/pLVUqQJKdVy2i2sH624qUK5903DSKRFlY/
 N2xUJIpRDwx6Rw4SZxmGANZxjfZDbI3400/YcVr9rHW2zA1v1QtYzW9IoGwIglKSClTQ
 WfmQ==
X-Gm-Message-State: ANhLgQ2slXNGu2+2hoOVuDtRQQRVHHM8Re9PifKv/XbR26Q5rCkPwsXU
 fqJva/KOovRInKF2qN08doANfjom
X-Google-Smtp-Source: ADFU+vsTJ8Yk2x9h+4TgLX4WZ8GbMocjklm9v7wnonYev2vT3HmBR2iSpS7D6V6h8ZMqcGMDC5QCBA==
X-Received: by 2002:a17:902:780b:: with SMTP id
 p11mr17814055pll.61.1583797131675; 
 Mon, 09 Mar 2020 16:38:51 -0700 (PDT)
Received: from ?IPv6:2601:641:c100:83a0:2cfc:b031:360c:4b81?
 ([2601:641:c100:83a0:2cfc:b031:360c:4b81])
 by smtp.gmail.com with ESMTPSA id q7sm31142339pfs.17.2020.03.09.16.38.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 16:38:50 -0700 (PDT)
Subject: Re: [PATCH v3 01/17] gcc PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
To: Alexander Cherepanov <ch3root@openwall.com>,
 GNU C Library <libc-alpha@sourceware.org>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
 <d3d2969f-4370-588b-b9be-a9ae0d38e10e@openwall.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <ee5cd5a1-b1a7-a27a-21e3-6044a07391a2@gmail.com>
Date: Mon, 9 Mar 2020 16:38:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d3d2969f-4370-588b-b9be-a9ae0d38e10e@openwall.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_163853_732823_B71F1AAF 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMy85LzIwIDg6MjMgQU0sIEFsZXhhbmRlciBDaGVyZXBhbm92IHdyb3RlOgo+Pgo+PiDCoMKg
wqDCoFBSIDg5ODc3Cj4+Cj4+IMKgwqDCoMKgKiBsb25nbG9uZy5oIFtfX2FyY19fXSAoYWRkX3Nz
YWFhYSk6IEFkZCBjYyBjbG9iYmVyCj4+IMKgwqDCoMKgKHN1Yl9kZG1tc3MpOiBMaWtld2lzZS4K
Pgo+IElzIFBSIG51bWJlciBpbiBzdWJqZWN0ICg4ODQwOSkgd3Jvbmc/IFRoZSBvbmUgaW4gQ2hh
bmdlbG9nICg4OTg3Nykgc2VlbXMgdG8gYmUKPiByaWdodC4KClllcyB5b3UgYXJlIHJpZ2h0LiBJ
J2xsIGZpeCB0aGlzIHVwLgoKVGh4LAotVmluZWV0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==

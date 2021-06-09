Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F301DC48BD1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 17:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26A3613D3
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 17:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26A3613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBZM2sGKvcwI5Vzy8f5XNi6L1w80hjmOVPYmwvE2HOA=; b=TZRgv72qul8dQ35LV+3bgVo+9E
	9m1hTJOKC0k+mWhKBLZqDLFEMt2TyFXkqh4/FtxL2+R4sat/3R+m8kRyVMqPh+GGYFU7p32xdW2VD
	5TBOGXae+ZxiZDSChAHBL1NnigNn06pRYi6QptqhLZiL5Rwu3ma6eybMipcWTiEVKQ6KCzrljmuvl
	3ilRzWI+wdSlolZBd/RpIWrU1tC5wZ37/mYdUvkNxVex0EbGWIOxBSUWi5r3iAImu7NVjOc9/Xn5i
	bk/npAVJG6pYaU42j/7aQdosumuy0OPP668e7i9Q0W0YWvUA1H/JdyawSnWorghcVExe+urwaVHZ2
	2Pv3MvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr221-00FJH2-0l; Wed, 09 Jun 2021 17:30:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr1Em-00EzcK-3O
 for linux-snps-arc@lists.infradead.org; Wed, 09 Jun 2021 16:39:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q15so19922292pgg.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 09 Jun 2021 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I5IRu80lLOMpanm9WUAqchFMOp+9/CtG6qdClPI2OkQ=;
 b=EM5p6O0l0hGQPJMOA7iex5AVFOFie4PRF7AxV75SM6YBBrsY1KWkZTUZKvtAOk3DGQ
 SGuQjkzS+5YH6QqW0xssrRDPr0F7EHYcZ8rtI8KwzZUnNzOIr+o0WFR+6ciWnSo5nemX
 SixrWcZiF6TLBxO0BecUfswnY2zBCrzygvT2auCpb+hetQuseq0hpLMhARfGUZsDzV4F
 6NEB4IcAmO3GVA5i74C4cY9aRX1L17qracsfUVgI0EVxAOCkB1MP1NMEgyGNnKanQBSm
 GvgRaF9pWUk9dC0KrQrpUcJ7ECLnXVMqnGVMgBEBIUs9fOOBcQH2zFB4/bbye+5cFZS5
 FZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I5IRu80lLOMpanm9WUAqchFMOp+9/CtG6qdClPI2OkQ=;
 b=rMlRNIzfQzT10BZvK5aGf6oHY6nBR2xzblL6UmT+Pn4AsPcPv0y8F6eN8HDK2EKYcI
 S5ouWtvLOFH3FIWYDRB7NDoOxjtuFVOzMBkvRvXqlH2HhJtLL3tvMokPCkiTulKr+idH
 mUiBadhIkwOp4wmx41GxrNK4OZjBRbH4GgRktC1erJ00uA//4Q3iPhIt6/+pgAiVwayh
 NZ3HKhuczD73v83tOePgiVwo8bBILgh3feWIjYxEVjOpi8nXWB0O5j3NnelyIhk4sRWC
 MAATQWr6xUYXUGY/GzYmmLQq1BRi2L7kx2rS8Nm7kRdtSfu2bO8o48X/B9QUchHCiu/U
 GquQ==
X-Gm-Message-State: AOAM533t5g+FPANMgHyleMiZ42ThjYs51iHysYOMwEX/cM58oOe9cVd5
 p28AEWyR36DZdxT3HxQVRDDirwvP1olCmA==
X-Google-Smtp-Source: ABdhPJwuukpJodVsO8TyVswLFt/TEpQOLV4fvlghgHNiCWaPkNw2Q9SZmRn9f0OMx344ohzBSasIMA==
X-Received: by 2002:a63:5c4:: with SMTP id 187mr574095pgf.368.1623256765351;
 Wed, 09 Jun 2021 09:39:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u5sm122576pfi.179.2021.06.09.09.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 09:39:24 -0700 (PDT)
Subject: Re: QEmu ARC port - decoder implementation feedback
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>
References: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c90a8c4-0977-b11b-b543-9eef4d4d14c3@linaro.org>
Date: Wed, 9 Jun 2021 09:39:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a882003d-4949-06ac-d111-8f41cb2d54b9@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_093928_211321_33BC29C1 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNi85LzIxIDI6NTggQU0sIEN1cGVydGlubyBNaXJhbmRhIHdyb3RlOgo+IFdlIHN0YXJ0ZWQg
dG8gZG8gdGhhdCBhbmQgaW4gdGhlIHByb2Nlc3Mgd2UgcmVhbGl6ZSB0aGF0IHRoZSBhcHByb2Fj
aAo+IHdvdWxkIGJyaW5nIHVzIHlldCBhbm90aGVyIGVuY29kaW5nIGxhbmd1YWdlIGRlc2NyaXB0
aW9uIHRvIG1haW50YWluLgoKV2h5IHdvdWxkIHlvdSBiZSBtYWludGFpbmluZyBhbm90aGVyIGRl
c2NyaXB0aW9uPyAgWW91ciBhcHByb2FjaCBiZWxvdyB3aXRoIHRoZSAKc2ltcGxlIHJlY3Vyc2l2
ZSBhbGdvcml0aG0gYXBwZWFycyB0byBiZSBubyBkaWZmZXJlbnQuCgo+IEFsc28gdGhhdCBkZWNv
ZGV0cmVlIGFsb25lIHdvdWxkIG5vdCBhbGxvdyB1cyB0byBwcm9wZXJseSBkaXNhc3NlbWJseQo+
IGNvZGUsIHN0aWxsIHJlcXVpcmluZyB0byBrZWVwIHRoZSBpbml0aWFsIHN0cnVjdHVyZS4KCldo
eSBpcyB0aGF0PwoKVGhlIGN1cnJlbnQgdXNlcyBvZiBkZWNvZGV0cmVlIGFyZSBxdWl0ZSBjb21w
bGV4LCBzbyBJIHNpbmNlcmVseSBkb3VidCB0aGF0IGl0IApjYW5ub3QgZG8gdGhlIGpvYi4gIFlv
dSd2ZSBhc2tlZCBubyBxdWVzdGlvbnMsIG5vciBoYXZlIHlvdSBkZXNjcmliZWQgYW55IApwcm9i
bGVtcyB5b3UgaGF2ZSBlbmNvdW50ZXJlZC4KClRoYXQgc2FpZCwgZGVjb2RldHJlZSB3YXMgbWVy
ZWx5IGEgc3VnZ2VzdGlvbiBiYXNlZCBvbiB3aGF0IGFwcGVhcmVkIHRvIG1lIHRvIApiZSBhIHRy
aXZpYWwgYXV0b21hdGVkIHRleHR1YWwgcmV3cml0ZSBvZiB5b3VyIGN1cnJlbnQgZGF0YSBzZXQu
ICBJZiB5b3Ugd2FudCAKdG8gdXNlIHNvbWV0aGluZyBlbHNlIHRoYXQgcGVyZm9ybXMgZXF1YWxs
eSB3ZWxsLCBmaW5lLgoKPiBTbyBmYXIsIHdlIGRpZCB0aGUgZm9sbG93aW5nOgo+ICAgIMKgLSBj
b252ZXJ0ZWQgb3Bjb2Rlcy5kZWYgdG8gbWFjcm9zIGluc3RlYWQgb2YgdGFibGUgZW50cmllcy4K
ClN1cmUuCgo+ICAgIMKgLSBjcmVhdGVkIGEgc2NyaXB0IHRoYXQgcmVhZHMgdGhvc2UgZW50cmll
cyBhbmQgb3V0cHV0cyBtYWNyb3MgdGhhdAo+IGRpcmVjdGx5IHRyYW5zbGF0ZSB0byBhIHN3aXRj
aC9jYXNlIGRlY2lzaW9uIHRyZWUgKGV4YW1wbGUgYmVsb3cpLCBqdXN0Cj4gbGlrZSB0aGUgb25l
cyBwcm9kdWNlZCBieSBkZWNvZGV0cmVlLiBUaGUgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZSBzd2l0
Y2gKPiB3aWxsIHJldHVybiB0aGUgZW51bSBlbnRyeSBmb3IgdGhlIHByb3BlciBkZWNvZGVyIHN0
cnVjdHVyZSBpbnN0ZWFkIG9mCj4gY2FsbGluZyBhIHRyYW5zbGF0aW9uIGZ1bmN0aW9uLgoKQW4g
ZW51bSByZXN1bHQgaXMgZmluZSwgc3VyZS4KClRoZSBleGFtcGxlIGlzIG5vdCBlc3BlY2lhbGx5
IGVubGlnaHRlbmluZyBiZWNhdXNlIHlvdSBkb24ndCBzaG93IHRoZSBtYWNybyAKZGVmaW5pdGlv
bnMsIG9yIHRoZSBleHBhbnNpb24uICBIYXZlIHlvdSBhIGxpbmsgdG8gYSBnaXQgcmVwbyB0aGF0
IHlvdSBjYW4gc2hhcmU/Cgo+ICAgIMKgLSB0aGUgc2NyaXB0IGNhbiBlaXRoZXIgYmUgY29udHJp
YnV0ZWQgaW4gQyBvciBweXRob24gbGFuZ3VhZ2UgYXMgaXQKPiBpcyBiYXNlZCBvbiBhIHNpbXBs
ZSByZWN1cnNpdmUgYWxnb3JpdGhtLgoKRWl0aGVyIGlzIGZpbmUuICBXZSBjdXJyZW50bHkgdXNl
IGJvdGggYXMgYnVpbGQtdGltZSBnZW5lcmF0b3JzLgoKCnJ+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==

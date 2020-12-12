Return-Path: <SRS0=Z2ph=FQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD77C4361B
	for <linux-snps-arc@archiver.kernel.org>; Sat, 12 Dec 2020 18:19:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E531622571
	for <linux-snps-arc@archiver.kernel.org>; Sat, 12 Dec 2020 18:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E531622571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cvailhb8lS1TK3tgmkKzHmIe9qw5mUg3373cuWGKmLE=; b=fnKwvvEblgFEUC9xmOGo4pE7R
	rSBfTkFVoxtETJpQDnN0s0lEdsCJhgmWW3bkVSOVaOEc2oHBYMnxit//Bcu/FPzL+umKcoRY9CwzV
	0BwNUWj3Bs1Ae8AdQg5Q50icVnQNSsJbo54zIBTKioaKXoiaPCQWTRHB/gYCeJcNXf5sAY+w2FQC9
	zX97+J69r48SWK5wNuLVudzpcWiADzkpm16nIsui9OgFssLetUfC1MiGT37DMhGNdxRjc7RDOopr+
	AAs/Qu8hTq141bRWWZHyOBQdKTo1ijfm1rIRx3gfQ4pjsyYF0Jx6+Y6Dfqh/C6kZhvUDSwBCV49e4
	FVpSAujHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ko9UQ-0007rT-1L; Sat, 12 Dec 2020 18:19:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ko9UN-0007r0-KV
 for linux-snps-arc@lists.infradead.org; Sat, 12 Dec 2020 18:19:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r7so12308661wrc.5
 for <linux-snps-arc@lists.infradead.org>; Sat, 12 Dec 2020 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8XuSZWyg0uMtUzXE2YH5qeHChdkix/Llk/GJWnOCg1w=;
 b=ndPXYE8q6gZ7VBW0OyGYsAFI/taVUKyhCPOBG3x336NFrXcta57QJWzEMiubWlJrGZ
 nGgd0YxwMiZDPrzxfHhyag0PL5LVekMrm17fAVWkUM578cF0coHWMv0jxFJKWTelh7Yq
 h9FOKQRYx7Y+om2DRiCnE2JbLTuHfBbQWDz3EDQ5M/uthct9I0+Qg8v0oownDKVJguiv
 pnym1W7WtRKe8IdxBS77adv9FA+Q92cutfiCnEdvnHtMa7D5spiMWy4TjUxxtAyGRlvX
 6AKtVsKSVqf/JEDkmNQ6MPK3MTwgdeFIoDJzF5O9HfIq26IRLCMi4rfrUkrt5JhD08Gc
 AJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8XuSZWyg0uMtUzXE2YH5qeHChdkix/Llk/GJWnOCg1w=;
 b=jpr+887pw2q1JkvMN7brqTtpDxvlrEYGrIydUvHbb75YRoaKV4rfPmsqEmw2buni65
 YmtHoAdOBw48e+ConlrxSc867RSvvDUAfFBSSJaXp5N+UQe7fc3+zpTt1nVLoBocfvve
 FJTx/BQRMBNXeQ6pNI8KLFTHle6J39mkD1NAkF9A9etAeQN09y1fmo4ZerRLIA8xZqhS
 p3Hi6NnXhFGdOKv0aGdrzN4/kMIs0BqIynwj66YejeswYDxmkZo44Z9vnjN6B5HTJx/r
 JOb3MbpJJZToww0ZpV4qjQ09f+bd9lrwu1ah9uICdrXZHoEqUUZ50XHG5N6D3xrIBAHz
 HkWw==
X-Gm-Message-State: AOAM531+BFbcfK8HDAid7Gu6zX4Rk9uwansSadwF/K+NZF4Cv4OCtD1l
 0Ecwtt5559f7GgP29i7wo+4=
X-Google-Smtp-Source: ABdhPJx+KJDQiyXc0PNDTzEPFX+MNbcM09DvihhpkyzrpnG1t/ZITmj93N0yBXsLBk5bT20QvllLrQ==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr19836610wrw.422.1607797165626; 
 Sat, 12 Dec 2020 10:19:25 -0800 (PST)
Received: from [192.168.0.160] ([170.253.49.0])
 by smtp.gmail.com with ESMTPSA id f199sm21586672wme.15.2020.12.12.10.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Dec 2020 10:19:25 -0800 (PST)
Subject: Re: [RFC] cacheflush.2: Document different prototypes for different
 architectures
To: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
 linux-man <linux-man@vger.kernel.org>
References: <c284e55d-98e9-ae53-b6ca-f331b73841c7@gmail.com>
 <20a8ebd5-ce04-1404-6113-02910cb21982@gmx.de>
From: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <6c1ae2e4-25d9-4364-0637-048c3b78c0fa@gmail.com>
Date: Sat, 12 Dec 2020 19:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20a8ebd5-ce04-1404-6113-02910cb21982@gmx.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_131927_735215_658BE166 
X-CRM114-Status: GOOD (  21.23  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgSGVpbnJpY2gsCgpHb29kLgpCVFcsIGl0IGxvb2tzIGxpa2UgaW50ZXJuYWxseSBMTFZNIHVz
ZXMgJ3ZvaWQgKidbMV0sCmJ1dCBDbGFuZyBleHBvc2VzICdjaGFyIConWzJdIGluIHRoZSBwcm90
b3R5cGUuICBXZWlyZC4uLgpJIHJlcG9ydGVkIHRoZSBidWcgeWVzdGVyZGF5OiBodHRwczovL2J1
Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTQ4NDg5CgpUaGFua3MsCgpBbGV4CgpbMV06Cmh0
dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9ibG9iLzQxNGQzZGM2MmM3MDZmNDEy
MjZiMGQ1NTIyMTBjNzlmNTA4MGRmNDMvY29tcGlsZXItcnQvbGliL2J1aWx0aW5zL2NsZWFyX2Nh
Y2hlLmMjTDU5ClsyXToKaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2Jsb2Iv
N2ZhZjYyYTgwYmZjM2E5ZGZlMzQxMzM2ODFmY2MzMWY4ZThkNjU4Yi9jbGFuZy9pbmNsdWRlL2Ns
YW5nL0Jhc2ljL0J1aWx0aW5zLmRlZiNMNTgzCgpPbiAxMi8xMi8yMCAxMjo1MiBBTSwgSGVpbnJp
Y2ggU2NodWNoYXJkdCB3cm90ZToKPiBPbiAxMi8xMS8yMCAxMDowOSBQTSwgQWxlamFuZHJvIENv
bG9tYXIgKG1hbi1wYWdlcykgd3JvdGU6Cj4+IEhpIE1pY2hhZWwsCj4+Cj4+IENvbnRpbnVpbmcg
d2l0aCB0aGUgY2hhbmdlcyBpbiB0aGlzIHRocmVhZDoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWFuLzc0N2Q1NmUwLWMxMDItYWI0MC1hZGQ0LTUzMGE0OGE0M2E0ZEBnbXguZGUv
VC8jdAo+Pgo+Pgo+PiBJIHJlc2VhcmNoZWQgdGhlIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIHRo
aXMgc3lzY2FsbC7CoCBJIGZvdW5kIHNvbWUKPj4gdGhhdCBjbGVhcmx5IHByb3ZpZGUgdGhlIHN5
c2NhbGwsIGFuZCBzb21lIHRoYXQgc2VlbSB0byBoYXZlIHNvbWV0aGluZywKPj4gYnV0IEkgZGlk
bid0IGZpbmQgYSBkZWZpbml0aW9uIGluIHRoZSBrZXJuZWwgKGkuZS4sIEFSTSwgTWljcm9CbGF6
ZQo+PiAoZ2xpYmMgb25seSk/KQo+IAo+IGFyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vdW5pc3Rk
Lmg6MzU6Cj4gI2RlZmluZSBfX0FSTV9OUl9jYWNoZWZsdXNowqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAoX19BUk1fTlJfQkFTRSsyKQo+IAo+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdW5p
c3RkLmg6Mzc6Cj4gI2RlZmluZSBfX0FSTV9OUl9jb21wYXRfY2FjaGVmbHVzaMKgwqAgKF9fQVJN
X05SX0NPTVBBVF9CQVNFICsgMikKPiAKPiBUaGVzZSBzeXNjYWxscyBhcmUgbWFya2VkIGFzIHBy
aXZhdGUuIFNvIHlvdSBzaG91bGQgbm90IHVzZSB0aGVtIGZyb20KPiB1c2VyIHNwYWNlLgo+IAo+
IFRoZSBjb21waWxlcnMgc2VlbSBub3QgdG8gY2FyZSBhYm91dCB0aGVzZSBzeXNjYWxscyBiZWlu
ZyBwcml2YXRlOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9yL2djYy9ibG9iL21h
c3Rlci9saWJnY2MvY29uZmlnL2FybS9saWIxZnVuY3MuUyNMMTUxMgo+IAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9sbHZtLW1pcnJvci9jb21waWxlci1ydC9ibG9iL21hc3Rlci9saWIvYnVpbHRpbnMv
Y2xlYXJfY2FjaGUuYwo+IAo+IAo+IEJlc3QgcmVnYXJkcwo+IAo+IEhlaW5yaWNoClsuLi5dCj4+
IFJlbmRlcmVkIHBhZ2UgKE5PVEVTIG9ubHkpOgo+Pgo+PiBbCj4+IE5PVEVTCj4+IMKgwqDCoCBB
cmNoaXRlY3R1cmUtc3BlY2lmaWMgdmFyaWFudHMKPj4gwqDCoMKgwqDCoMKgwqAgR2xpYmPCoCBw
cm92aWRlcyBhIHdyYXBwZXIgZm9yIHRoaXMgc3lzdGVtIGNhbGwsIHdpdGggdGhlIHByb+KAkAo+
PiDCoMKgwqDCoMKgwqDCoCB0b3R5cGUgc2hvd24gaW4gU1lOT1BTSVMsIGZvcsKgIHRoZcKgIGZv
bGxvd2luZ8KgIGFyY2hpdGVjdHVyZXM6Cj4+IMKgwqDCoMKgwqDCoMKgIEFSQywgQ1NLWSwgTUlQ
UywgYW5kIE5JT1MyLiAvLyBsb3dlcmNhc2U/Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgIE9uwqAgc29t
ZSBvdGhlciBhcmNoaXRlY3R1cmVzLCBMaW51eCBwcm92aWRlcyB0aGlzIHN5c3RlbSBjYWxsCj4+
IMKgwqDCoMKgwqDCoMKgIHdpdGggZGlmZmVyZW50IGFyZ3VtZW50czoKPj4KPj4gwqDCoMKgwqDC
oMKgwqAgTTY4SzoKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgY2FjaGVmbHVzaCh1
bnNpZ25lZCBsb25nIGFkZHIsIGludCBzY29wZSwgaW50IGNhY2hlLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbGVu
KTsKPj4KPj4gwqDCoMKgwqDCoMKgwqAgU0g6Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW50IGNhY2hlZmx1c2godW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwgaW50
Cj4+IG9wKTsKPj4KPj4gwqDCoMKgwqDCoMKgwqAgTkRTMzI6Cj4+Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IGNhY2hlZmx1c2godW5zaWduZWQgaW50IHN0YXJ0LCB1bnNpZ25lZCBpbnQg
ZW5kLCBpbnQKPj4gY2FjaGUpOwo+Pgo+PiDCoMKgwqAgR0NDIGFsdGVybmF0aXZlCj4+IMKgwqDC
oMKgwqDCoMKgIFVubGVzcyB5b3UgbmVlZCB0aGUgZmluZXIgZ3JhaW5lZCBjb250cm9swqAgdGhh
dMKgIHRoaXPCoCBzeXN0ZW0KPj4gwqDCoMKgwqDCoMKgwqAgY2FsbMKgIHByb3ZpZGVzLMKgIHlv
dcKgIHByb2JhYmx5wqAgd2FudMKgIHRvIHVzZSB0aGUgR0NDIGJ1aWx0LWluCj4+IMKgwqDCoMKg
wqDCoMKgIGZ1bmN0aW9uIF9fYnVpbHRpbl9fX2NsZWFyX2NhY2hlKCksIHdoaWNoIHByb3ZpZGVz
IGEgcG9ydGFibGUKPj4gwqDCoMKgwqDCoMKgwqAgaW50ZXJmYWNlwqAgYWNyb3NzwqAgcGxhdGZv
cm1zwqAgc3VwcG9ydGVkIGJ5IEdDQyBhbmQgY29tcGF0aWJsZQo+PiDCoMKgwqDCoMKgwqDCoCBj
b21waWxlcnM6Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCBfX2J1aWx0aW5fX19j
bGVhcl9jYWNoZSh2b2lkICpiZWdpbiwgdm9pZCAqZW5kKTsKPj4KPj4gwqDCoMKgwqDCoMKgwqAg
T24gcGxhdGZvcm1zIHRoYXQgZG9uJ3QgcmVxdWlyZcKgIGluc3RydWN0aW9uwqAgY2FjaGXCoCBm
bHVzaGVzLAo+PiDCoMKgwqDCoMKgwqDCoCBfX2J1aWx0aW5fX19jbGVhcl9jYWNoZSgpIGhhcyBu
byBlZmZlY3QuCj4+Cj4+IMKgwqDCoMKgwqDCoMKgIE5vdGU6wqAgT27CoCBzb21lwqAgR0NDLWNv
bXBhdGlibGUgY29tcGlsZXJzLCBzdWNoIGFzIGNsYW5nLCB0aGUKPj4gwqDCoMKgwqDCoMKgwqAg
cHJvdG90eXBlIGZvciB0aGlzIGZ1bmN0aW9uIHVzZXMgY2hhciAqIGluc3RlYWQgb2Ygdm9pZCAq
IGZvcgo+PiDCoMKgwqDCoMKgwqDCoCB0aGUgcGFyYW1ldGVycy4KPj4KPj4gXQo+Pgo+PiAnR0ND
IGFsdGVybmF0aXZlJyBpcyB0aGUgbmFtZSBJIGdhdmUgdG8gdGhlIE5PVEVTIGZyb20gdGhlIG90
aGVyIHRocmVhZCwKPj4gd2hpY2ggYXJlbid0IHlldCBtZXJnZWQgKEknbGwgc2VuZCB0aGUgcGF0
Y2hlcyBhZnRlciB0aGUgd2Vla2VuZCwKPj4gcHJvYmFibHkpLgo+Pgo+PiBTdWJzZWN0aW9ucyBi
YXNlZCBvbjoKPj4gZmFkdmlzZTY0KDIpCj4+Cj4+IENhbiB5b3UgcmV2aWV3IHRoaXM/Cj4+Cj4+
IFRoYW5rcywKPj4KPj4gQWxleAo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

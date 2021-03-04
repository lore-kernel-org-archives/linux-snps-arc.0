Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C1CC433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 23:57:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB4C564FFD
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 23:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB4C564FFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kek2TWeU1d6NiCs48jpkRs6syje+BY1v8x2LNwHIFA0=; b=lFjjaKUq9NEeu7i3x8sMyllBj
	FPF2Afab0dCHicbUCOIWMVOAat8l7yXoniXKkxbfaZ22dlmDMdyW2lijPtf4RvsT0MRYd6b3cpCqp
	8SnZNW6o4KDG7+FW4vN5H5CxyIdEcbbhsfMf35fpjEkyJRjIDrEq2U3FPoeJjtq0exUUKofLiqS+O
	k3cqgSesm+uj3opOXYhjlf98Y8MVWTRaLAtNX2MH3Hl0u08ySSygvNkpMrMawOijN5CEmuoxjGUI/
	KjqTyul/1FAS2iXFUEfsTsR4tvn33OhuUcXlbh1nXUyIGvqanZA5EtjCmiYm9Rdhs3OE9fwh+F13V
	zG+McIaug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHxq4-00AqTb-9r; Thu, 04 Mar 2021 23:57:06 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHxpz-00AqSm-Ke
 for linux-snps-arc@lists.infradead.org; Thu, 04 Mar 2021 23:57:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id i14so627099pjz.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 04 Mar 2021 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G33wZkyebsXi3Ndt2z+qe85bI3FnDHqnHICEtSeMnaA=;
 b=YZ/G+5/KT2h88XVCa7ZEU0HKVlFpfEzQ69Ih6oEIfxA4ju8nsjQpH5DvrYiSuDjdrp
 4q0BI7ngM6WN0iyg2TudQ/ISFLw+LRlAU1yZQ+ExiXwXP8Khon23WD1gJrLMWdXuMDX1
 6zK6UpEWZn2SvpqbI40S33+1kEXkU/YGWK+Q/ji4NjftwtPfOpkLdzSx2tOC7vojE2DT
 hX3VQNSflTcvCMKrZUG2CYtaHQz7AJP/YqPKz8ZrrYCump2j9/q9SA4QpxxjlGZOJRNm
 yE9AWIJzm8kPpbO2V7J1LUzk7KRzBQuynf4xzFbyYqBpI/l6Rj/mGTQjAWTvWtdMzeQd
 FIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G33wZkyebsXi3Ndt2z+qe85bI3FnDHqnHICEtSeMnaA=;
 b=NA/o7Y2nV3RhpUWuoIDYEeowiGltJYHyDie/LwsQg9zpUlISNxk8GC0a1XQdOws+A0
 Hz5vd7FIcIyX45VQUZsMcCwQmJNeYfZKpW5Br299u+/2I6urPm8mrdY/L1gGe893REay
 mdiJ+ZXrwJG2TCjZ72yR77hsr52Jjtsd77bTKtdhZaLNy1ro9gmMwGdM1OAyZDWqhNjG
 sKLKqJ2r5ZP9IKggXHO3j/BxthqXTtyDVAT0rDjflbZrIz5vzn5TD5YN45BgOQc3oYvf
 pJJr3f/xvDBjGur+z4x7mEkLKegHj/apxQDQTwu0IAk1rUMLI8C795h/7xDOzbcUutEK
 ISew==
X-Gm-Message-State: AOAM533LgDbL89vguLddYuyWSodenJGr6vUFJKkXRWCAX1nt+zP7MELe
 mrPzKrBnx0R2PfNDcUXlipdDdMcaMsX3Ug==
X-Google-Smtp-Source: ABdhPJw1qtqJDAg4mIlSvreOCE9bSNBnWvSMwlxnu9CMk2uVJO2T+E+6fPIX8v9F4mIcgwMPbev9bw==
X-Received: by 2002:a17:902:b58e:b029:e3:2313:42ab with SMTP id
 a14-20020a170902b58eb02900e3231342abmr6273828pls.9.1614902217059; 
 Thu, 04 Mar 2021 15:56:57 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id gg22sm336841pjb.20.2021.03.04.15.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 15:56:56 -0800 (PST)
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
To: Guillem Jover <guillem@debian.org>, 980963@bugs.debian.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Helmut Grohne <helmut@subdivi.de>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
Date: Thu, 4 Mar 2021 15:56:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_235659_891835_223427F6 
X-CRM114-Status: GOOD (  27.54  )
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

SGkgR3VpbGxlbSwKCk9uIDMvNC8yMSA1OjU1IEFNLCBHdWlsbGVtIEpvdmVyIHdyb3RlOgo+IEhp
IQo+IAo+IE9uIFN1biwgMjAyMS0wMS0yNCBhdCAyMzozNjo1MiArMDMwMCwgQWxleGV5IEJyb2Rr
aW4gd3JvdGU6Cj4+IFBhY2thZ2U6IGRwa2cKPj4gVmVyc2lvbjogMS4xOS43dWJ1bnR1My0xfjIw
MjEwMTIzMjEzNH51YnVudHUyMC4wNC4xCj4+IFNldmVyaXR5OiB3aXNobGlzdAo+PiBUYWdzOiBw
YXRjaAo+IAo+PiBBUkMgYXJjaGl0ZWN0dXJlIHNlZW0gdG8gbWF0Y2ggcmVxdWlyZW1lbnRzIGZv
ciBiZWluZyBhZGRlZCB0byB0aGUgZHBrZwo+PiAoaHR0cHM6Ly93aWtpLmRlYmlhbi5vcmcvVGVh
bXMvRHBrZy9GQVEjUS5fQ2FuX3dlX2FkZF9zdXBwb3J0X2Zvcl9uZXdfZHBrZ19hcmNoaXRlY3R1
cmVzLjNGKToKPj4KPj4gICAqIEdOVSB0cmlwbGV0IGlzIHRoZXJlIHNpbmNlIDIwMTMsCj4+ICAg
ICBzZWU6IGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dpdC9jb25maWcuZ2l0L2NvbW1p
dC8/aWQ9OTg2MzYwZGU2ZTQxMmNiZWQyN2RiZTJkYmZiNjRkZGJkMThlNzM3MAo+PiAgICogQmlu
dXRpbHMsIEdDQyAmIHVDbGliYyBzdXBwb3J0IEFSQyBmb3IgbWFueSB5ZWFycyBub3csCj4+ICAg
ICBnbGliYyAyLjMyIGZpbmFsbHkgZ2FpbmVkIEFSQyBzdXBwb3J0LCBzZWUgaHR0cHM6Ly9saXN0
cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9pbmZvLWdudS8yMDIwLTA4L21zZzAwMDAyLmh0bWwKPiAK
PiBTb3JyeSwgZGlkbid0IHJlcGx5IHVwIHRvIG5vdyBkdWUgdG8gdGhlIGZyZWV6ZSwgdGhpcyBu
b3QgbG9va2luZwo+IHJlYWR5IHlldCAoYXMgZ2xpYmMgaXMgbm90IGV2ZW4gaW4gRGViaWFuKSwg
YnV0IG1vc3RseSBiZWNhdXNlIGl0Cj4gc2xpcHBlZCBteSBtaW5kLCBidXQgdGhhdCBraW5kIG9m
IGJsb2NrcyBwcm9ncmVzcyBvbiB5b3VyIHNpZGUuCj4gU28gbGV0J3Mgc2VlLiA6KQo+IAo+IE9y
LCB3ZXJlIHlvdSBsb29raW5nIHRvIGdldCB0aGlzIGluY2x1ZGVkIGZvciBidWxsc2V5ZT8gKEkg
dGhpbmsgdGhpcwo+IHdvdWxkIG5vdCBxdWFsaWZ5LCBidXQsIEkgdGhpbmsgd2UgbWlnaHQgaGF2
ZSBkb25lIGV4Y2VwdGlvbnMgaW4gc3VjaAo+IGNhc2VzIGluIHRoZSBwYXN0LikKCldlIGRvbicg
aGF2ZSBhIHRpbWVsaW1lLCBidXQgdGhlIHNvb25lciB0aGUgYmV0dGVyIDstKQpJIGp1c3Qgd2Fu
dCB0byBmbHVzaCBvdXQgYW55IG1pc3NpbmcgcGllY2VzIGZyb20gQVJDIHNpZGUgb2YgdGhlIHRo
aW5ncy4KCj4gSXMgdGhlIEFCSSBmdWxseSBzdGFiaWxpemVkIG5vdz8KCkl0IGlzLiBPbmUgdGhp
bmcgdG8gbm90ZSBpcyB0aGF0IEFSQyBmb2xsb3dzIHRoZSA2NC1iaXQgdGltZV90L29mZnNldHMs
IApmb3IgMzItYml0IGFyY2hlcywgZW5hYmxlZCBieSBnbGliYyAyLjMyIChhbmQgdGhhdCBpcyB0
aGUgb25seSBnbGliYyBBQkkgCndlIHN1cHBvcnQpLiBGV0lXIFJWMzIgYmVpbmcgdGggZW9ubHkg
b3RoZXIgMzItYml0IGFyY2ggKHNvIGZhcikgdG8gZG8gCnRoYXQuIEknbSBub3Qgc3VyZSBpZiB0
aGUgZGViaWFuIGVjb3N5c3RlbSBpcyBwcmVwYXJlZCBmb3IgdGhpcyBpbiAKZ2VuZXJhbCAoZm9y
IDMyLWJpdCBhcmNoZXMpLiBBdCB0aGUgdGltZSBmaXhlcyB3ZXJlIG5lZWRlIGluIHNpbXBsZXN0
IG9mIAp0aGluZ3MgbGlrZSBidXN5Ym94IHNvIEknbSB3b25kZXJpbmcgaWYgd2hhdCBzdXBwb3J0
IGlmIG5lZWRlZCBlbHNld2hlcmUgCm9yIGlzIGl0IHRoZXJlIGFscmVhZHkuCgoKPj4gPkZyb20g
OTY1MjNlMTg0NzNiNTY3NDNiZjJmN2QzMDhjMmQ3ODZmMzM3ZTUyZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPj4gRnJvbTogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5bm9wc3lzLmNvbT4K
Pj4gRGF0ZTogU3VuLCAyNCBKYW4gMjAyMSAwMDozNDo1MiArMDMwMAo+PiBTdWJqZWN0OiBbUEFU
Q0hdIEFkZCBBUkMgYXJjaGl0ZWN0dXJlCj4gCj4+IGRpZmYgLS1naXQgYS9kYXRhL2NwdXRhYmxl
IGIvZGF0YS9jcHV0YWJsZQo+PiBpbmRleCA5ZjJhOGUwZTQuLjExNGE2NmVjYiAxMDA2NDQKPj4g
LS0tIGEvZGF0YS9jcHV0YWJsZQo+PiArKysgYi9kYXRhL2NwdXRhYmxlCj4+IEBAIC0yMCw2ICsy
MCw4IEBAIGkzODYJCWk2ODYJCShpWzM0NTY3XTg2fHBlbnRpdW0pCTMyCWxpdHRsZQo+PiAgIGlh
NjQJCWlhNjQJCWlhNjQJCQk2NAlsaXR0bGUKPj4gICBhbHBoYQkJYWxwaGEJCWFscGhhLioJCQk2
NAlsaXR0bGUKPj4gICBhbWQ2NAkJeDg2XzY0CQkoYW1kNjR8eDg2XzY0KQkJNjQJbGl0dGxlCj4+
ICthcmMJCWFyYwkJYXJjLioJCQkzMglsaXR0bGUKPj4gK2FyY2ViCQlhcmMJCWFyY2ViLioJCQkz
MgliaWcKPj4gICBhcm1lYgkJYXJtZWIJCWFybS4qYgkJCTMyCWJpZwo+PiAgIGFybQkJYXJtCQlh
cm0uKgkJCTMyCWxpdHRsZQo+PiAgIGFybTY0CQlhYXJjaDY0CQlhYXJjaDY0CQkJNjQJbGl0dGxl
Cj4gCj4gVGhpcyBsb29rZWQgaW5jb3JyZWN0LCBhcyBpdCBlbmRzIHVwIG5vdCBiZWluZyBhIGJp
amVjdGl2ZSByZWxhdGlvbiwKPiBzbyB0aGUgbGluZXMgbmVlZCB0byBiZSBzd2FwcGVkLiBUaGUg
cHJvYmxlbSBpcyB0aGF0IHRoZSBjb21tZW50cyBkbwo+IG5vdCBleHBsYWluIHRoaXMgbm9yIHRo
ZSB0ZXN0IHN1aXRlIGNoZWNrcy4gU28gSSBpbXByb3ZlZCBib3RoIHdpdGggdGhlCj4gYXR0YWNo
ZWQgcGF0Y2hlcywgd2hpY2ggSSdsbCBjb21taXQgaW50byBtYXN0ZXIgb25jZSBJIG9wZW4gaXQg
dXAgZm9yCj4gMS4yMS54LgoKVGh4LiBXZSBhcmUgZGViaWFuIG5vb2JzIHNvIHBsZWFzZSBmZWVs
IGZyZWUgdG8gbWFzc2FnZSB0aGVtIGZvciAKY29ycmVjdG5lc3MgYW5kL29yIGZlZWwgZnJlZSB0
byBhc2sgdXMgdG8gcmV3b3JrLgoKCj4gQWxzbyBqdXN0IHRvIG1ha2Ugc3VyZSwgdGhlIEdOVSB0
cmlwbGV0cyBhcmU6Cj4gCj4gICAgYXJjLWxpbnV4LWdudQo+ICAgIGFyY2ViLWxpbnV4LWdudQo+
IE5vIEFCSSBtb2RpZmllcnMgKHN0dWZmIGxpa2Ug4oCcZWFiaeKAnSkgZm9yIHRoZSBsaWJjIHBh
cnQgKOKAnGdudeKAnCkgcmlnaHQ/CgpBY3R1YWxseSBpdCBzZWVtcyB3ZSBhcmUgbWlzc2luZyBo
YXJkZmxvYXQgaGVyZTogQVJDIGdsaWJjL2djYyBzdXBwb3J0IAppdCB2ZXJ5IHdlbGwgYW5kIHNo
b3VsZCBiZSBkZWZhdWx0IGZvciBhbnkgcmVhc29uYWJsZSBwZXJmb3JtYW5jZS4KClNvIEkgdGhp
bmsgd2Ugc2hvdWxkIGFkZAogICAgIGFyYy1saW51eC1nbnVoZgogICAgIGFyY2ViLWxpbnV4LWdu
dWhmCgpCVFcgSSBoYXZlIG9jZSBxdWVzdGlvbjogd2hlcmUgZG9lcyBvbmUgc2VsZWN0IHdoYXQg
ZGVmYXVsdCB0b2dnbGVzIHRvIApidWlsZCB0aGUgZW50aXJlIHNvZnR3YXJlIHN0YWNrIHdpdGgg
KHNheSAtbWNwdSBldGMpLiBEb2VzIHRoaXMgcmVseSBvbiAKdG9vbGNoYWluIGRyaXZlciBkZWZh
dWx0IHRvIERSVEguIE9uZSBvZiBteSBwcm9ibGVtcyB3aXRoIHJlYm9vdHN0cmFwIAp3YXMgZ2Nj
IGRyaXZlciBkZWZhdWx0aW5nIHRvIG91ciBsZWdhY3kgY3B1LiBJJ3ZlIGN1cmVkIGl0IHRoZXJl
IChhbmQgCnBsYW5uaW5nIHRvIHVwc3RyZWFtIHRoZSBnY2MgZHJpdmVyIHBhdGNoKS4KClRoeCwK
LVZpbmVldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=

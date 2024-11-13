Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB3D41C12
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2024 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crAXWVpSB1jdjozYDTKw+ySqfORnGaurbnn7+qaix/Y=; b=NtUK4hKNFbpS1r
	ftrNUoMDqerlkCR0Qx2DxTq8ewE/MVMqLGg+uKNX637sSHXityVfKWTRHP2lE5d7d4aWJurU075vJ
	oUeAp+lY7/GMyym+XTmBH+io+un8QtW6/NpmoT39s+soh93LfXsQfnx8iatxLQhS0xqO7gkzrDTcz
	6NPbX4x8QfmXaA+WfUYxwwxL1Zt5qm6yXVyEna2pX/JR8kdlgTGKwn5yVxoCqw5/r1X+53u+lc9GI
	20nVpsegoUUSTSv/FXV+hXnl/ITEdLO3Q/YxNLPUnr2O8vy0SVSrOLlNKV7kokOsiMcghps9lVhpF
	8u2eW4NWFgugFs9lRoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Ls-000000063IX-49aU;
	Wed, 13 Nov 2024 08:03:49 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Lp-000000063IA-1jtc
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Nov 2024 08:03:48 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1731485020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EU1k9AMEn/tc26JK+CGYVsgo3nAeKg3I3puW7ATTdAM=;
	b=ramRqTKGMlEWUG6s8JlLeeewYyPHOO1FlckkgQKa2+duIcS10fkhQf97a9r6F5EZAlIdkQ
	yfLymEAegdz+pjls2QXVoMI5y7CzSsX7HF0B4VFAoXPIWKYKkdSx4CkzQuF3W6UtPzwhoO
	asb0qODJMEpQorv7vtWDdgqp4helBnPPOMXi8ESmHSYFN/GkWDvNZaBe6OvBZS5F7X7axY
	j8HMdXSxJW/+ksbo0R4fH+FkPfRobdsHovUAhehl9cxHYBtvWt7mcoLe2du6dkchg13YhZ
	cQmF4DfdamuhYdwf2dXuDcETwsmfWVgS9IySjtXJE0JzCBbStAukA3VaL3OXPA==
Date: Wed, 13 Nov 2024 08:03:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Shahab Vahedi" <list+bpf@vahedi.org>
Message-ID: <c617471892505a16188397d4120b21ebd553a457@vahedi.org>
TLS-Required: No
Subject: Re: [PATCH] ARC: bpf_jit_arcv2: Remove redundant condition check
To: "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Vadim 
 Fedorenko" <vadim.fedorenko@linux.dev>, ast@kernel.org, andrii@kernel.org
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song 
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "John 
 Fastabend" <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Vineet Gupta" <vgupta@kernel.org>,
 bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <PN0P287MB28435A985BADB4B4D857223AFF5A2@PN0P287MB2843.INDP287.PROD.OUTLOOK.COM>
References: <20241111142028.67708-1-hardevsinh.palaniya@siliconsignals.io>
 <e6d27adb-151c-46c1-9668-1cd2b492321b@linux.dev>
 <6454497ff35d2a534cd34b7635fb044e4033fe6b@vahedi.org>
 <PN0P287MB28435A985BADB4B4D857223AFF5A2@PN0P287MB2843.INDP287.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_000346_526251_B14C3D1B 
X-CRM114-Status: GOOD (  13.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGFyZGV2IHdyb3RlOgoKPiBTaGFoYWIgd3JvdGU6wqAKPiA+ICAKPiA+IFZhZGltIHdyb3RlOgo+
ID4gPiAKPiA+ID4gCj4gPiA+IFRoZSBvcmlnaW5hbCBjb2RlIGlzIG9idmlvdXNseSBvcHRpbWl6
ZWQgb3V0LCBidXQgdGhlIGludGVudGlvbiwgSQo+ID4gPiBiZWxpZXZlLCB3YXMgdG8gY2hlY2sg
aWYgdGhlIGp1bXAgaXMgY29uZGl0aW9uYWwgb3Igbm90Lgo+ID4gPiBTbyB0aGUgcHJvcGVyIGZp
eCBzaG91bGQgY2hhbmdlIHRoZSBjb2RlIHRvIGNoZWNrIGNvbmQ6Cj4gPiA+Cj4gPiA+ICAgLSBp
ZiAoQVJDX0NDX0FMKQo+ID4gPiAgICsgaWYgKGNvbmQgPT0gQVJDX0NDX0FMKQo+ID4KPiA+IAo+
ID4gVGhhdCBpcyBhYnNvbHV0ZWx5IGNvcnJlY3QuIElmIGEgbmV3IHBhdGNoIGlzIG5vdCBzdWJt
aXR0ZWQgc29vbgo+ID4gSSdsbCB0cnkgdG8gZml4IGl0IG15c2VsZi4KPgo+IGlmIHlvdSBhcmUg
b2theSB3aXRoIHRoYXQgdGhlbiBJIGNhbiBwcm9jZWVkIGJ5IHN1Ym1pdHRpbmcgdmVyc2lvbiAy
Cj4gb2YgdGhlIHBhdGNoIHdpdGggdGhlIHByb3Bvc2VkIGNoYW5nZXMgaW5jbHVkZWQKCk9mIGNv
dXJzZS4gUGxlYXNlIGdvIGFoZWFkLiBUbyBiZSBjbGVhciwgV2hhdCBJIG1lYW50IGJ5ICJzb29u
IiB3YXMKc29tZXRoaW5nIGFyb3VuZCBhIHdlZWsgdGltZS4KCgpDaGVlcnMsClNoYWhhYgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

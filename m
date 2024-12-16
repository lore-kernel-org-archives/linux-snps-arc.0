Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DCAE7717F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2024 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYCdfCOr6OLvKE/PRQh4GWz8bC2a+kLRmpnZ4kU+eCo=; b=ngEW+LD33ezWzq
	QZeGlkvxdsIMqBbprv3UJi8o9zT6stLn5rMdKXvB+Q/yLE9PgpC0W5RNJooMLaFf5N9qzWhgtqihZ
	WleAWRkAogZaFrHP2PDJ/HiEZY6+eanAYhWU7Vzg0DQQTh8t41qhhqXYwqTP5G0nJzBdyOKuytZzw
	jlvvyNGJwoMGpvP65WHy6kwB37XyAAPUcqfNH1/8RKF1FCwt3HeMDQZuCrsbiu3FKBqelQALF+2Z1
	6A20BgWQdGTarDGbozHEgnKsU4oD/Q5lVdE42OeLjN3Kdro9pCI7K5ClEZuAO/KqTb44vfB8GVFjz
	FvRB22zX6fA1cal64Krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNK7C-0000000BbtX-3aXx;
	Mon, 16 Dec 2024 23:03:02 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNK7A-0000000Bbt4-2JjY
	for linux-snps-arc@lists.infradead.org;
	Mon, 16 Dec 2024 23:03:01 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6ef0ef11aafso38936117b3.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Dec 2024 15:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734390178; x=1734994978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kgbUCS6yRX96lOYmbdxrGaaVnG1rWgKUlUa61iIjIk=;
        b=I236RIhSDrjHZjbhx3bcp33/ayciY38N4Opn/iqNuSXd4xhSwswt9ZQQrbj4icBmDe
         F5GY6slBXdl/kXEutuXANqMfxcQLYYuEIe8vW6VPzKeDQZQKouNzfmWPRHfbODxlmy4w
         +eGjghuDZt+9X3EDUhI/EmNTkTVWYcgKx73ajXo5xgwZUYmVjaUO3OoppAdNcIryX4F3
         v4PJpdxB5KlWoK9ZCQHUqU7iIfGZZGqYlm4vXrn8wiuN4B6NL+PSQ+bk/FQvXMO0re4A
         i1CqCMilrjAgrrWbwCREo/D13g23wnAOZQ3AMepucXozx19on3qR6xc7rrAcS/qsB2j/
         wPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390178; x=1734994978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kgbUCS6yRX96lOYmbdxrGaaVnG1rWgKUlUa61iIjIk=;
        b=bSr7SpIa+CIx2IzgBJuIkWaJZ99FYzLShrwNdBkc2pbC+3Dvbi6ZkmYfSx/2/SvUKS
         8O4BZsOdd4wNeERj9E6yd1AOFwmK1b/f37FnhjqBV+AzuReu0Oa0njaGbFa8ikhT1R4s
         WbtGv2CUoqwtdcCVE9AAysGxdfmbQuuyTEjwVK/uXE64o9TzgaRMvEcMfoA9u7Y+KxJ+
         pU7dNvgSo4YyMPupNd0Cq7Xgr6P5Gm/T+mJuaIFTH/HklPUbOC7t6qn/yVpqIeJ2bNNb
         Qa7v416PgmNgZsTdwOSCpGYwAfzzn1YP0rLJD6Hku+XT4/4NBVez9T+s3XMJ5fFo1dVj
         Rkwg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHQcAzpw+f2SoRagqNfxl58R+6RPXj2FoFyug5SaMYowoko2V0kJCHu+g/3YRmIlAliVYtiMobja2RTD4hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpsJq+nJ72a+2z5nDnrwZxRDdiTZgVbFh3js/SUEgYdcvI1w+Y
	lM2FHnDRTzdJP9vKYuAUxyYh/KlGi8Wac/lcHhx8DAyU9kHPsM0LiTAmuWdnkz6uLQ3tM0qbCtI
	NWsgX/tZBumBn20NuqVVxyCodG67Et8DBpQH1
X-Gm-Gg: ASbGncvtV5KHwz6r48kR8TemiJam03EakXLu/y3OahrS42X+CVMM2BnVx4NI9hIae9U
	iCL/QY0ZVhfsRCK+R3ZmlevLv0NfAijGna0b/
X-Google-Smtp-Source: AGHT+IHrwagCDxh86JudR61ERsEoZaOO+nNF5gGHxdmt+LQ6ru1sGeudHuNKonCIKj4X7Au1PNG0jPlYUBpASW7wnTk=
X-Received: by 2002:a05:690c:690c:b0:6ee:c338:9d4a with SMTP id
 00721157ae682-6f279bb01d6mr139492107b3.28.1734390178273; Mon, 16 Dec 2024
 15:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com> <20241213054610.55843-6-laoar.shao@gmail.com>
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Dec 2024 18:02:47 -0500
Message-ID: <CAHC9VhSHP4zt-GtOWgjzC+vVJriJh32_T+7dt0uBtTLXuoYvnQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	x86@kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev, 
	Kees Cook <kees@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_150300_593042_4E8A7089 
X-CRM114-Status: GOOD (  14.35  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMTI6NDfigK9BTSBZYWZhbmcgU2hhbyA8bGFvYXIuc2hh
b0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2luY2UgdGFzay0+Y29tbSBpcyBndWFyYW50ZWVkIHRv
IGJlIE5VTC10ZXJtaW5hdGVkLCB3ZSBjYW4gcHJpbnQgaXQKPiBkaXJlY3RseSB3aXRob3V0IHRo
ZSBuZWVkIHRvIGNvcHkgaXQgaW50byBhIHNlcGFyYXRlIGJ1ZmZlci4gVGhpcwo+IHNpbXBsaWZp
ZXMgdGhlIGNvZGUgYW5kIGF2b2lkcyB1bm5lY2Vzc2FyeSBvcGVyYXRpb25zLgo+Cj4gU2lnbmVk
LW9mZi1ieTogWWFmYW5nIFNoYW8gPGxhb2FyLnNoYW9AZ21haWwuY29tPgo+IENjOiBLZWVzIENv
b2sgPGtlZXNAa2VybmVsLm9yZz4KPiBDYzogUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1vb3JlLmNv
bT4KPiBDYzogSmFtZXMgTW9ycmlzIDxqbW9ycmlzQG5hbWVpLm9yZz4KPiBDYzogIlNlcmdlIEUu
IEhhbGx5biIgPHNlcmdlQGhhbGx5bi5jb20+Cj4gLS0tCj4gIHNlY3VyaXR5L3lhbWEveWFtYV9s
c20uYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpZb3UgbmVlZCB0byB3YWl0IGZvciBLZWVzJyBBQ0ssIGJ1dCB0aGlzIGxvb2tz
IG9rYXkgdG8gbWUuCgpSZXZpZXdlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1vb3JlLmNv
bT4KCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3lhbWEveWFtYV9sc20uYyBiL3NlY3VyaXR5L3lh
bWEveWFtYV9sc20uYwo+IGluZGV4IGUxYTVlMTNlYTI2OS4uNGJkZmE1MWVhNmZkIDEwMDY0NAo+
IC0tLSBhL3NlY3VyaXR5L3lhbWEveWFtYV9sc20uYwo+ICsrKyBiL3NlY3VyaXR5L3lhbWEveWFt
YV9sc20uYwo+IEBAIC03Niw3ICs3Niw2IEBAIHN0YXRpYyB2b2lkIHJlcG9ydF9hY2Nlc3MoY29u
c3QgY2hhciAqYWNjZXNzLCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqYWdlbnQpCj4gIHsKPiAg
ICAgICAgIHN0cnVjdCBhY2Nlc3NfcmVwb3J0X2luZm8gKmluZm87Cj4gLSAgICAgICBjaGFyIGFn
ZW50X2NvbW1bc2l6ZW9mKGFnZW50LT5jb21tKV07Cj4KPiAgICAgICAgIGFzc2VydF9zcGluX2xv
Y2tlZCgmdGFyZ2V0LT5hbGxvY19sb2NrKTsgLyogZm9yIHRhcmdldC0+Y29tbSAqLwo+Cj4gQEAg
LTg1LDkgKzg0LDggQEAgc3RhdGljIHZvaWQgcmVwb3J0X2FjY2Vzcyhjb25zdCBjaGFyICphY2Nl
c3MsIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICAgICAgICAgICAgICAgICAgKiBJbWFn
aW5lIGFuZ3J5IHJhbnRpbmcgYWJvdXQgcHJvY2ZzIGhlcmUuCj4gICAgICAgICAgICAgICAgICAq
Lwo+ICAgICAgICAgICAgICAgICBwcl9ub3RpY2VfcmF0ZWxpbWl0ZWQoCj4gLSAgICAgICAgICAg
ICAgICAgICAicHRyYWNlICVzIG9mIFwiJXNcIlslZF0gd2FzIGF0dGVtcHRlZCBieSBcIiVzXCJb
JWRdXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgYWNjZXNzLCB0YXJnZXQtPmNvbW0sIHRhcmdl
dC0+cGlkLAo+IC0gICAgICAgICAgICAgICAgICAgZ2V0X3Rhc2tfY29tbShhZ2VudF9jb21tLCBh
Z2VudCksIGFnZW50LT5waWQpOwo+ICsgICAgICAgICAgICAgICAgICAgInB0cmFjZSAlcyBvZiBc
IiVwVE5cIlslZF0gd2FzIGF0dGVtcHRlZCBieSBcIiVwVE5cIlslZF1cbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICBhY2Nlc3MsIHRhcmdldCwgdGFyZ2V0LT5waWQsIGFnZW50LCBhZ2VudC0+cGlk
KTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+Cj4gLS0KPiAyLjQzLjUK
Ci0tIApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1zbnBzLWFyYwo=

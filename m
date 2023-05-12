Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5513AC77B7F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CssLBzp/FYZsA6N/HitSY5DVq+JbMrsNP6yH3rZ80Og=; b=SUbRMu0hAh6/0D
	e0aK7ucq25+vhP8lWOThscniuEWD8HX3NfNkC4Otie1T3B+8cnqOrdF85J2Z1hsgHSkBGzLqXc1cj
	Vyh3pH6ngoVSUOv0jDtUG50hIeCtW+mKl06FnriD8U0eumHFBd9ikdPQMn1oRe3MqETY6gbCax3Lc
	10vgu2ilNmRvO0EgTnjHlLElCY1VbRH6LKHgVhDgCzJ+yUryFlMZD1TX5GYqwuk3mLBnSVPc/NBBe
	6Lo2mCZlseI0AP6bprg1u7IPgeHI1vrY3byhobIecRRJ+kv0+UjbZPPDX8nT8ca+RxvBbOkAZcITo
	G9O5wtUh/hD86c8obZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPyq-00BbeG-38;
	Fri, 12 May 2023 10:26:32 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPyo-00Bbdi-1y;
	Fri, 12 May 2023 10:26:31 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-559e2051d05so140740387b3.3;
        Fri, 12 May 2023 03:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683887188; x=1686479188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7oE+wnAwx9lWj1Dzx32p5gbR9ZsZdOiJLOsGIhtwMM=;
        b=QVOiEWtUGGg296G7qbzSIGyUkjMLwTjt7CxAuS/pvLiGk/3nlChQ4U2N45vfCNXHYJ
         s0nEP/3HlWd7wxPEeG0YveAZF3nf7juldP9JmH6fpAfiys/4t5XccOI40QZzH3rXmOpO
         dI1+ezC8u4EdIuj4G8cpUdRcHFeIPy9mGomb9I/A4LE4i+vvYszhRCkeSy6gJuVVSHwf
         nbCyepBykG4NefR4gl/4AnYqoUekcLYwW5H2t6TxKnN7Rr052faJuXvBrPIL81qWVG2A
         +33dAdogEeD+hv/sy2jqs+JfpBNHT5ZygYJdY/O+Sb5LlgGFKnSdtMvlKDrX33E6hFqx
         L4Ww==
X-Gm-Message-State: AC+VfDwfg6mY/HEH4Hf8UYXGCj+qIJ5fhUogad7G6xa66PW7KYqr9rvU
	mZ5iWqsSHHibSFPn9eB4GTghBSIm2ZKZ3Q==
X-Google-Smtp-Source: ACHHUZ6GW4rSgl7xjAk3NL8KkTcSTFcmKDI5I8w4GPoUKVS9ckLcwWkS8jOMDts6tu05eS37+4Ygaw==
X-Received: by 2002:a81:920c:0:b0:55a:a635:7e1e with SMTP id j12-20020a81920c000000b0055aa6357e1emr27240717ywg.31.1683887187720;
        Fri, 12 May 2023 03:26:27 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id e124-20020a0df582000000b0055db1f73722sm5172110ywf.107.2023.05.12.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 03:26:26 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-559e53d1195so140909107b3.2;
        Fri, 12 May 2023 03:26:26 -0700 (PDT)
X-Received: by 2002:a0d:c281:0:b0:536:cb48:9059 with SMTP id
 e123-20020a0dc281000000b00536cb489059mr25024547ywd.50.1683887185987; Fri, 12
 May 2023 03:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
 <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org> <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
In-Reply-To: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 12:26:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
Message-ID: <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
Subject: Re: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_032630_670309_44A2101F 
X-CRM114-Status: GOOD (  25.59  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTE6NTXigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAxOjU5
4oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiA+
IEZ1bmN0aW9ucyB0aGF0IHdvcmsgb24gYSBwb2ludGVyIHRvIHZpcnR1YWwgbWVtb3J5IHN1Y2gg
YXMKPiA+IHZpcnRfdG9fcGZuKCkgYW5kIHVzZXJzIG9mIHRoYXQgZnVuY3Rpb24gc3VjaCBhcwo+
ID4gdmlydF90b19wYWdlKCkgYXJlIHN1cHBvc2VkIHRvIHBhc3MgYSBwb2ludGVyIHRvIHZpcnR1
YWwKPiA+IG1lbW9yeSwgaWRlYWxseSBhICh2b2lkICopIG9yIG90aGVyIHBvaW50ZXIuIEhvd2V2
ZXIgc2luY2UKPiA+IG1hbnkgYXJjaGl0ZWN0dXJlcyBpbXBsZW1lbnQgdmlydF90b19wZm4oKSBh
cyBhIG1hY3JvLAo+ID4gdGhpcyBmdW5jdGlvbiBiZWNvbWVzIHBvbHltb3JwaGljIGFuZCBhY2Nl
cHRzIGJvdGggYQo+ID4gKHVuc2lnbmVkIGxvbmcpIGFuZCBhICh2b2lkICopLgo+ID4KPiA+IEZp
eCB1cCB0aGUgb2ZmZW5kaW5nIGNhbGxzIGluIGFyY2gvbTY4ayB3aXRoIGV4cGxpY2l0IGNhc3Rz
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiA+IC0tLQo+ID4gQ2hhbmdlTG9nIHYxLT52MjoKPiA+IC0gQWRkIGFuIGV4dHJh
IHBhcmVucyBhcm91bmQgdGhlIHBhZ2UgYXJndW1lbnQgdG8gdGhlCj4gPiAgIFBEX1BUQUJMRSgp
IG1hY3JvLCBhcyBpcyBub3JtYWxseSByZXF1aXJlZC4KPgo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0
ZSEKPgo+IFRvIGJ1aWxkIHN1bjNfZGVmY29uZmlnIGFuZCBtNTQ3NWV2Yl9kZWZjb25maWcgY2xl
YW5seSwgeW91IG5lZWQgdG8KPiBpbmNsdWRlIHRoZSAoR21haWwtd2hpdGVzcGFjZS1kYW1hZ2Vk
KSBjaGFuZ2VzIGJlbG93Lgo+IFRoZXNlIHdlcmUgY29tcGlsZS10ZXN0ZWQgb25seS4KCj4gLS0t
IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3N1bjNfcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL3N1bjNfcGd0YWJsZS5oCj4gQEAgLTEwOSw5ICsxMDksOSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcHRlX2NsZWFyIChzdHJ1Y3QgbW1fc3RydWN0Cj4gKm1tLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHB0ZV90ICpwCj4gICNkZWZpbmUgcGZuX3B0ZShwZm4sIHBncHJvdCkgXAo+ICAo
eyBwdGVfdCBfX3B0ZTsgcHRlX3ZhbChfX3B0ZSkgPSBwZm4gfCBwZ3Byb3RfdmFsKHBncHJvdCk7
IF9fcHRlOyB9KQo+Cj4gLSNkZWZpbmUgcHRlX3BhZ2UocHRlKSAgICAgICAgICB2aXJ0X3RvX3Bh
Z2UoX19wdGVfcGFnZShwdGUpKQo+ICsjZGVmaW5lIHB0ZV9wYWdlKHB0ZSkgICAgICAgICAgdmly
dF90b19wYWdlKCh2b2lkICopX19wdGVfcGFnZShwdGUpKQoKTXVjaCBzaW1wbGVyIHRvIGRyb3Ag
dGhlIGNhc3QgaW4gX19wdGVfcGFnZSgpIGluc3RlYWQ6CgpAQCAtOTEsNyArOTEsNyBAQCBzdGF0
aWMgaW5saW5lIHB0ZV90IHB0ZV9tb2RpZnkocHRlX3QgcHRlLCBwZ3Byb3RfdCBuZXdwcm90KQog
I2RlZmluZSBwbWRfc2V0KHBtZHAscHRlcCkgZG8ge30gd2hpbGUgKDApCgogI2RlZmluZSBfX3B0
ZV9wYWdlKHB0ZSkgXAotKCh1bnNpZ25lZCBsb25nKSBfX3ZhICgocHRlX3ZhbCAocHRlKSAmIFNV
TjNfUEFHRV9QR05VTV9NQVNLKSA8PCBQQUdFX1NISUZUKSkKKyAgICAgICAgKF9fdmEgKChwdGVf
dmFsIChwdGUpICYgU1VOM19QQUdFX1BHTlVNX01BU0spIDw8IFBBR0VfU0hJRlQpKQoKIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBwbWRfcGFnZV92YWRkcihwbWRfdCBwbWQpCiB7Cgo+ICAj
ZGVmaW5lIHBtZF9wZm4ocG1kKSAgICAgICAgICAgKHBtZF92YWwocG1kKSA+PiBQQUdFX1NISUZU
KQo+IC0jZGVmaW5lIHBtZF9wYWdlKHBtZCkgICAgICAgICAgdmlydF90b19wYWdlKHBtZF9wYWdl
X3ZhZGRyKHBtZCkpCj4gKyNkZWZpbmUgcG1kX3BhZ2UocG1kKSAgICAgICAgICB2aXJ0X3RvX3Bh
Z2UoKHZvaWQgKilwbWRfcGFnZV92YWRkcihwbWQpKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==

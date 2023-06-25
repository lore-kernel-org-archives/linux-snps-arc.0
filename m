Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39596C0015E
	for <linux-snps-arc@archiver.kernel.org>; Sun, 25 Jun 2023 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfH1Cp9XjvJjmCROrIYdrAd4RNS78LKFP37VpbP/8IE=; b=jjQMJ1VCL2CpYG
	GgMJNCEfuugoufdyhZBaBTIgvMZDHpSPgH3Wclz8o0Awb5kTX39qpXmZnUO2ypv8qA6WtBHVL5Gf0
	c8j+5VfZ0xUeAW0eSuTw0rxMd57tFuS72y6Q0V/jOxPD73Vi6uk4DWPFJS7xhl1wJOLtrL8xKQwdg
	usf0Z/cMhq+yWJigg8XNyjhxWBNRc9XLKEWgjoiyak16qwY5z/oADIsdU3hNMMgLS2WfsliRml5K8
	6IPfT2c4kerN95JRubq/a5hpP8TKsnS2bJuz+q3TJIZNOWaZu3XYtnQ/tjLvBlKDCp+dGVamRF54+
	hJMZBUQufytm+X8NSBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDUQF-008Ruc-1U;
	Sun, 25 Jun 2023 18:25:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDUQC-008Rtz-0i
	for linux-snps-arc@lists.infradead.org;
	Sun, 25 Jun 2023 18:25:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D420760BAA
	for <linux-snps-arc@lists.infradead.org>; Sun, 25 Jun 2023 18:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C9FC433C8
	for <linux-snps-arc@lists.infradead.org>; Sun, 25 Jun 2023 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687717510;
	bh=lptCDt96ilGC/OpMciopJy0C4Ydb0tBjW5sqv48x0yI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CeMe1IYvKi0//tHqDJz4UNqUgfOPgj7AYbqJvgjPCN3rAyYeLDIgfgkRHg692DUxO
	 ro4TJRdCtCTTN4yh3DAogZlpn6V5lgmjrIxyllncClGuFYjHolKpJoHa+7OOo9fWBJ
	 DAj4zIRHcc2Ean4pFspdOQug/ybALtUqSQtlfusjgVsGAC6gqOdx+erxxsMGIJYwCn
	 d/mi0m/YvnKSTxbpjSnmpeqSjz9h0G9gtll4PvqldYYPD2iMBZytZUXuCUWuFGsEiC
	 m46ZpkOzYjC2BK8ePYqiBupZAnFC4DpZgmQspiYcJq9nQ9EJgurXllS0eU0gH5Jax2
	 nt2JZ7Eqs/3sg==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3909756b8b1so1260465b6e.1
        for <linux-snps-arc@lists.infradead.org>; Sun, 25 Jun 2023 11:25:10 -0700 (PDT)
X-Gm-Message-State: AC+VfDzriQPunJwAX/s38hb5l1iZfZaxttMQ6dDEnxpP+FIH9HOy5mK1
	eeeOkYPaLMI5NHc4oLS4cqARkkWmqv0559rZWZY=
X-Google-Smtp-Source: ACHHUZ7ExvMJ0YdgLqIGnfb3fbsDX2rWow9AjMUqHU0+MJx/o9Et46IPBdZvVw/dSRRx08ycUEfVtMrSDl1Gm9EeOnk=
X-Received: by 2002:a05:6808:191f:b0:3a1:dc0d:f31f with SMTP id
 bf31-20020a056808191f00b003a1dc0df31fmr719402oib.3.1687717509553; Sun, 25 Jun
 2023 11:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230615111743.883891-1-masahiroy@kernel.org> <f7e9220aad3d98bd174f7dcbd68031e1e15ea968.1687461492.git.josh@joshtriplett.org>
In-Reply-To: <f7e9220aad3d98bd174f7dcbd68031e1e15ea968.1687461492.git.josh@joshtriplett.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 Jun 2023 03:24:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLti=Cp1WRAzMufXpXLvM=X1WHLN1RT=-ZAc1q06pPcw@mail.gmail.com>
Message-ID: <CAK7LNARLti=Cp1WRAzMufXpXLvM=X1WHLN1RT=-ZAc1q06pPcw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: builddeb: always make modules_install, to install modules.builtin*
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ben Hutchings <ben@decadent.org.uk>, 
	linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_112512_321284_DAD652F8 
X-CRM114-Status: GOOD (  11.87  )
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNDoyMOKAr0FNIEpvc2ggVHJpcGxldHQgPGpvc2hAam9z
aHRyaXBsZXR0Lm9yZz4gd3JvdGU6Cj4KPiBFdmVuIGZvciBhIG5vbi1tb2R1bGFyIGtlcm5lbCwg
dGhlIGtlcm5lbCBidWlsZHMgbW9kdWxlcy5idWlsdGluIGFuZAo+IG1vZHVsZXMuYnVpbHRpbi5t
b2RpbmZvLCB3aXRoIGluZm9ybWF0aW9uIGFib3V0IHRoZSBidWlsdC1pbiBtb2R1bGVzLgo+IFRv
b2xzIHN1Y2ggYXMgaW5pdHJhbWZzLXRvb2xzIG5lZWQgdGhlc2UgZmlsZXMgdG8gYnVpbGQgYSB3
b3JraW5nCj4gaW5pdHJhbWZzIG9uIHNvbWUgc3lzdGVtcywgc3VjaCBhcyB0aG9zZSByZXF1aXJp
bmcgZmlybXdhcmUuCj4KPiBOb3cgdGhhdCBgbWFrZSBtb2R1bGVzX2luc3RhbGxgIHdvcmtzIGV2
ZW4gaW4gbm9uLW1vZHVsYXIga2VybmVscyBhbmQKPiBpbnN0YWxscyB0aGVzZSBmaWxlcywgdW5j
b25kaXRpb25hbGx5IGludm9rZSBpdCB3aGVuIGJ1aWxkaW5nIGEgRGViaWFuCj4gcGFja2FnZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEpvc2ggVHJpcGxldHQgPGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4K
PiAtLS0KCgpBcHBsaWVkIHRvIGxpbnV4LWtidWlsZC4gVGhhbmtzLgoKV2hhdCBJIG1lYW50IGlu
IG15IHByZXZpb3VzIHJlcGx5IHdhcwp0byByZW1vdmUgImlmIGlzX2VuYWJsZWQgQ09ORklHX01P
RFVMRVM7IHRoZW4iCgpBbnl3YXksIEkgZGlkIGl0IGJ5IG15c2VsZiBpbiBhIGZvbGxvdy11cCBw
YXRjaC4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtidWlsZC8yMDIzMDYyNTE4MTYy
My4yNDczMzA4LTEtbWFzYWhpcm95QGtlcm5lbC5vcmcvVC8jdQoKCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==

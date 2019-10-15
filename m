Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E167ECE58F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 18:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C682086A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 18:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSopjqvb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="ih4zeCbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C682086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfNrbyzH4Xx9hAAbc/uFQF6Lpbbp4L5Dp3KxcZA/+Oc=; b=rSopjqvb76d70n
	bTd+BBA34Tvhr+Uzt0qTkl5DnNTY61vYtinlSBumXsXNm727xvJSUwH8nCvnVdk9ZZAFyxoTrpRyX
	T240FmuQoVv2DyWoTS38OVM1xjTpKvjQn3itJ65ofEAZlwgRtqLK3sYuuRkTSNQDbfclr+zO4/QjG
	WQ89YMGsMJw/0b6BB3LMqREd2/XxQi8lIJnqmZPR/C0eaCUvIT/4wm8RVuiB57eWRl00JNPGOdt7T
	xa6lO+zuKQyyHMdAL1ANb6byp/TCN+yBndlbmeajmmjSH1OovDBRZPXM3WWGm3dLDxUeirqVxEq+/
	iRmFusU70zy9H3KOPqxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKRlp-0003GD-6R; Tue, 15 Oct 2019 18:42:09 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKRll-0003Ev-Kp
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 18:42:07 +0000
Received: by mail-qt1-x842.google.com with SMTP id c21so32012379qtj.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
 b=ih4zeCbnEW9LSQmgDID0erLrP4wKSRd4quPFdjB7jDfMBRahOCBa+C67Dy1NqHkrCv
 VJSNTqSrY43O2EJhupvXVshQ0BC82dIhxESVHTwLHkCEPN42OBS3yBTYdKusIr1FPyqX
 wpUPZ/cGTRy5YK2T6ObGKxHp1+6vi2CjoWlyTCo/dPXrhBn0tNseTwJyJuKrduDqfttY
 fd4SW/I4j0BpnaIdz6zO9hqQf6+agjiuheLCXQaQrYEDCeHJq0DF3gEtcT6Uvp1RF+B9
 gDgx+ctEQBhsj7GuizlLnNWuM5pbIfjPRVvTdcRA7Ese4V0mQHl7lb1qg7KFEBXx5acS
 G4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
 b=GwEwqCayoiblqG+NW+taDehhew9APxABzBGTu6J3wTzi9SmUCadlnB+ri5NwmMhhZI
 jlq/NDvr6p7QmzRBtjMEtnyREOK+tscMxyTA6E139Mae7VDFqhrEWBoxpQ89D8kBWNX0
 kN9aMWSNX05jyaKmk+UmolK1vz52oR3Q/phdjaEuuKldXAVlVQece9lqp3xFnprScat8
 IMh/qPEPQSGHgs0TSu/hFpZWuwDAWQ2nJRFB9KCZ+bMENMTHnj15elzB033L3j2Ca2hV
 FNHHWZKqL1/wcQEvtWLppzI4Br2jVwaAE3FCtJTG+533w923wNRf6wnbTwzo11ObEXhB
 JYtA==
X-Gm-Message-State: APjAAAU2sJTVohpmQ/mURjTF8+/Aw01DOfoW5S77XooGV4/4sOqScmYZ
 WHqXMS+MU96qo69njaWMFZLkDA==
X-Google-Smtp-Source: APXvYqwar5I/V60pS57/UcDUw1cogFuq6+7hHVlNRpscniqz5EATufxt8kONpUilAAyTNCHiUcXZ9w==
X-Received: by 2002:ac8:1c49:: with SMTP id j9mr41218038qtk.364.1571164924491; 
 Tue, 15 Oct 2019 11:42:04 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id o28sm9204198qkk.106.2019.10.15.11.42.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 11:42:03 -0700 (PDT)
Message-ID: <1571164920.5937.45.camel@lca.pw>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Tue, 15 Oct 2019 14:42:00 -0400
In-Reply-To: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
 <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_114205_688801_C46B01E2 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDE5LTEwLTE1IGF0IDIwOjUxICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90
ZToKPiAKPiBPbiAxMC8xNS8yMDE5IDA4OjExIFBNLCBRaWFuIENhaSB3cm90ZToKPiA+IFRoZSB4
ODYgd2lsbCBjcmFzaCB3aXRoIGxpbnV4LW5leHQgZHVyaW5nIGJvb3QgZHVlIHRvIHRoaXMgc2Vy
aWVzICh2NSkgd2l0aCB0aGUKPiA+IGNvbmZpZyBiZWxvdyBwbHVzIENPTkZJR19ERUJVR19WTV9Q
R1RBQkxFPXkuIEkgYW0gbm90IHN1cmUgaWYgdjYgd291bGQgYWRkcmVzcwo+ID4gaXQuCj4gPiAK
PiA+IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9jYWlsY2EvbGludXgtbW0vbWFz
dGVyL3g4Ni5jb25maWcKPiA+IAo+ID4gW8KgwqDCoDMzLjg2MjYwMF1bwqDCoMKgwqBUMV0gcGFn
ZTpmZmZmZWEwMDA5MDAwMDAwIGlzIHVuaW5pdGlhbGl6ZWQgYW5kIHBvaXNvbmVkCj4gPiBbwqDC
oMKgMzMuODYyNjA4XVvCoMKgwqDCoFQxXSByYXc6IGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZm
ZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmCj4gPiBmZmZmZmY4NzExNDBdW8KgwqDCoMKgVDFdwqDC
oD8gX3Jhd19zcGluX3VubG9ja19pcnErMHgyNy8weDQwCj4gPiBbwqDCoMKgMzMuODcxMTQwXVvC
oMKgwqDCoFQxXcKgwqA/IHJlc3RfaW5pdCsweDMwNy8weDMwNwo+ID4gW8KgwqDCoDMzLjg3MTE0
MF1bwqDCoMKgwqBUMV3CoMKga2VybmVsX2luaXQrMHgxMS8weDEzOQo+ID4gW8KgwqDCoDMzLjg3
MTE0MF1bwqDCoMKgwqBUMV3CoMKgPyByZXN0X2luaXQrMHgzMDcvMHgzMDcKPiA+IFvCoMKgwqAz
My44NzExNDBdW8KgwqDCoMKgVDFdwqDCoHJldF9mcm9tX2ZvcmsrMHgyNy8weDUwCj4gPiBbwqDC
oMKgMzMuODcxMTQwXVvCoMKgwqDCoFQxXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+IFvCoMKgwqAz
My44NzExNDBdW8KgwqDCoMKgVDFdIC0tLVsgZW5kIHRyYWNlIGU5OWQzOTJiMGY3YmVmYmQgXS0t
LQo+ID4gW8KgwqDCoDMzLjg3MTE0MF1bwqDCoMKgwqBUMV0gUklQOiAwMDEwOmFsbG9jX2dpZ2Fu
dGljX3BhZ2Vfb3JkZXIrMHgzZmUvMHg0OTAKPiAKPiBIbW0sIHdpdGggZGVmY29uZmlnIChERUJV
R19WTT15IGFuZCBERUJVR19WTV9QR1RBQkxFPXkpIGl0IGRvZXMgbm90IGNyYXNoIGJ1dAo+IHdp
dGggdGhlIGNvbmZpZyBhYm92ZSwgaXQgZG9lcy4gSnVzdCB3b25kZXJpbmcgaWYgaXQgaXMgcG9z
c2libGUgdGhhdCB0aGVzZQo+IHBhZ2VzIG1pZ2h0IG5vdCBiZWVuIGluaXRpYWxpemVkIHlldCBi
ZWNhdXNlIERFRkVSUkVEX1NUUlVDVF9QQUdFX0lOSVQ9eSA/CgpZZXMsIHRoaXMgcGF0Y2ggd29y
a3MgZmluZS4KCmRpZmYgLS1naXQgYS9pbml0L21haW4uYyBiL2luaXQvbWFpbi5jCmluZGV4IDY3
NmQ4MDIwZGQyOS4uNTkxYmU4ZjllOGUwIDEwMDY0NAotLS0gYS9pbml0L21haW4uYworKysgYi9p
bml0L21haW4uYwpAQCAtMTE3Nyw3ICsxMTc3LDYgQEAgc3RhdGljIG5vaW5saW5lIHZvaWQgX19p
bml0IGtlcm5lbF9pbml0X2ZyZWVhYmxlKHZvaWQpCsKgwqDCoMKgwqDCoMKgwqB3b3JrcXVldWVf
aW5pdCgpOwrCoArCoMKgwqDCoMKgwqDCoMKgaW5pdF9tbV9pbnRlcm5hbHMoKTsKLcKgwqDCoMKg
wqDCoMKgZGVidWdfdm1fcGd0YWJsZSgpOwrCoArCoMKgwqDCoMKgwqDCoMKgZG9fcHJlX3NtcF9p
bml0Y2FsbHMoKTsKwqDCoMKgwqDCoMKgwqDCoGxvY2t1cF9kZXRlY3Rvcl9pbml0KCk7CkBAIC0x
MTg2LDYgKzExODUsOCBAQCBzdGF0aWMgbm9pbmxpbmUgdm9pZCBfX2luaXQga2VybmVsX2luaXRf
ZnJlZWFibGUodm9pZCkKwqDCoMKgwqDCoMKgwqDCoHNjaGVkX2luaXRfc21wKCk7CsKgCsKgwqDC
oMKgwqDCoMKgwqBwYWdlX2FsbG9jX2luaXRfbGF0ZSgpOworwqDCoMKgwqDCoMKgwqBkZWJ1Z192
bV9wZ3RhYmxlKCk7CisKwqDCoMKgwqDCoMKgwqDCoC8qIEluaXRpYWxpemUgcGFnZSBleHQgYWZ0
ZXIgYWxsIHN0cnVjdCBwYWdlcyBhcmUgaW5pdGlhbGl6ZWQuICovCsKgwqDCoMKgwqDCoMKgwqBw
YWdlX2V4dF9pbml0KCk7Cgo+IAo+IFsgICAxMy44OTg1NDldWyAgICBUMV0gcGFnZTpmZmZmZWEw
MDA1MDAwMDAwIGlzIHVuaW5pdGlhbGl6ZWQgYW5kIHBvaXNvbmVkCj4gWyAgIDEzLjg5ODU0OV1b
ICAgIFQxXSByYXc6IGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZm
ZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYKPiBbICAgMTMuODk4NTQ5XVsgICAgVDFdIHJhdzogZmZm
ZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZm
ZmZmZmZmZgo+IFsgICAxMy44OTg1NDldWyAgICBUMV0gcGFnZSBkdW1wZWQgYmVjYXVzZTogVk1f
QlVHX09OX1BBR0UoUGFnZVBvaXNvbmVkKHApKQo+IFsgICAxMy44OTg1NDldWyAgICBUMV0gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gWyAgIDEzLjg5ODU0OV1bICAgIFQx
XSBrZXJuZWwgQlVHIGF0IC4vaW5jbHVkZS9saW51eC9tbS5oOjExMDchCj4gWyAgIDEzLjg5ODU0
OV1bICAgIFQxXSBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFNNUCBERUJVR19QQUdFQUxMT0Mg
S0FTQU4gUFRJCj4gWyAgIDEzLjg5ODU0OV1bICAgIFQxXSBDUFU6IDAgUElEOiAxIENvbW06IHN3
YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjQuMC1yYzMtbmV4dC0yMDE5MTAxNSsgIwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=

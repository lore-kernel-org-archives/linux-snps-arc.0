Return-Path: <SRS0=blQs=5P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663F4C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 21:22:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2556520733
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 21:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DWhYJrbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2556520733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/WnRI//8bT8IwuMKNSXtENGVipaiCzqGlpjOJ8xz/0=; b=DWhYJrbPOf2jbL
	babtB+yXyHgYl15U3RCdffc9W4PbhMRgo5uNOCoMN4/Bryumz/jkJj0LtVPYty/6oCKoAXTYrG6sS
	twrwlycvDoqQvGfWr99hOWliCuGXMOv4yODU5KKHgZE3wAA7JOcUC50iFuIL6o6lirzPIulIdgMfs
	+4H9Pniv9WIjnqmZrf4gyD+eJCRQccvy2zDxSezE1gHqYUVxeH9MaUR4Kqn+CgcA0kX29Vi77/f/8
	69j4vIvGX5kFPx4Bf9sd/Yso8ZtpyV4pvSFErYiWXyrYeGZ0bo717Q7nvt33L5S7uX87U3Qvdp7eP
	S/grswD4nHAtZy1hDa7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ1rx-0006G1-TK; Mon, 30 Mar 2020 21:22:53 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ1ru-0006FR-MX
 for linux-snps-arc@lists.infradead.org; Mon, 30 Mar 2020 21:22:52 +0000
Received: by mail-ot1-f65.google.com with SMTP id c9so19747459otl.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 30 Mar 2020 14:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vyl+JushNUhxQR9kB/ILsOGZBSYFhnFHl07ojWx3Yr0=;
 b=V5AFutz1IqpTREcj2ISTIawHhsJyRndBx/FEpiZ0eskJbNaG0W3/yRjG16IdnQurSs
 VhK93QLt0rLJPPFhE/JFO86FFdOKM8lXsCyuGv/lVj7QmeoklFFc43U7GDLOew2fWnGh
 p3lFYYILTUOxF7YRIl3V7L6GzJ6NdDcz3vmn+E8qea5K8DNjrGoUOtMBEoqqALJthBvd
 SBiVRDhVDiElNelN4lI40rDJ//p/gAKuZXBNsqPGAhqZGEVKlr4wUqbEQkl/vYB6jhBa
 ZCkLSpK2lYCd9O0gntpzrxWNSh0CqlMZQEGsl0hH2anpuOTHJHawnitLEFrGF1tPxA7P
 5K8Q==
X-Gm-Message-State: ANhLgQ0wlIKEFsuirQ/m1S+3/FSgJaZphN+JNdG6p2n6h+6DpFpWyIH5
 CcfPgFOxdzHE1F2CVenZU7CBqRRXa+NN/+upECuoRw==
X-Google-Smtp-Source: ADFU+vuatsYFQyzw7KGCdnpaDr1LX96t9W2MKuazQT8eQzMhRM3meDvFmKUJz35yCx0cVZmZIt0zxUQD3IpYwuMtlZQ=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr10645908otk.145.1585603368284; 
 Mon, 30 Mar 2020 14:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200330085854.19774-1-geert@linux-m68k.org>
 <CAHp75Vc1gW2FnRpTNm6uu4gY3bSmccSkCFkAKqYraLincK29yA@mail.gmail.com>
 <CAMuHMdXDBtOo_deXsmX=zA9_va0O5j8XydxoigmS35+Tj7xDDA@mail.gmail.com>
 <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
 <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
In-Reply-To: <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2020 23:22:36 +0200
Message-ID: <CAMuHMdWJ22zUkvMXBPBLoNhUkf0bnFBxa_WZAhiUWzA3r4eDkA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.6
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_142250_739909_9D17F992 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgVmluZWV0LAoKT24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgMTE6MTggUE0gVmluZWV0IEd1cHRh
CjxWaW5lZXQuR3VwdGExQHN5bm9wc3lzLmNvbT4gd3JvdGU6Cj4gT24gMy8zMC8yMCAxOjQwIFBN
LCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToKPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KPiA+
PiBTZW50OiBNb25kYXksIE1hcmNoIDMwLCAyMDIwIDQ6MjggUE0KPiA+PiBUbzogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz47IEFsZXhleSBCcm9ka2luIDxhYnJvZGtp
bkBzeW5vcHN5cy5jb20+Cj4gPj4gQ2M6IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gPj4gU3ViamVjdDogUmU6IEJ1aWxkIHJlZ3Jlc3Np
b25zL2ltcHJvdmVtZW50cyBpbiB2NS42Cj4gPj4KPiA+PiBPbiBNb24sIE1hciAzMCwgMjAyMCBh
dCA0OjI2IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+ID4+Pgo+ID4+PiBIaSBBbmR5LAo+ID4+Pgo+ID4+PiBPbiBNb24sIE1hciAzMCwgMjAyMCBh
dCAzOjA4IFBNIEFuZHkgU2hldmNoZW5rbwo+ID4+PiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPj4+PiBPbiBNb24sIE1hciAzMCwgMjAyMCBhdCAxMjowMCBQTSBHZWVydCBV
eXR0ZXJob2V2ZW4KPiA+Pj4+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPj4+Pj4g
QmVsb3cgaXMgdGhlIGxpc3Qgb2YgYnVpbGQgZXJyb3Ivd2FybmluZyByZWdyZXNzaW9ucy9pbXBy
b3ZlbWVudHMgaW4KPiA+Pj4+PiB2NS42WzFdIGNvbXBhcmVkIHRvIHY1LjVbMl0uCj4gPj4+Pgo+
ID4+Pj4+ICAgKyAva2lzc2tiL3NyYy9pbmNsdWRlL2xpbnV4L2Rldl9wcmludGsuaDogd2Fybmlu
ZzogZm9ybWF0ICclenUnIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZQo+ID4+ICdzaXplX3QnLCBi
dXQgYXJndW1lbnQgOCBoYXMgdHlwZSAndW5zaWduZWQgaW50JyBbLVdmb3JtYXQ9XTogID0+IDIz
MjoyMwo+ID4+Pj4KPiA+Pj4+IFRoaXMgaXMgaW50ZXJlc3RpbmcuLi4gSSBjaGVja2VkIGFsbCBk
ZXZfV0FSTl9PTkNFKCkgYW5kIGRpZG4ndCBmaW5kIGFuIGlzc3VlLgo+ID4+Pgo+ID4+PiBhcmN2
Mi9heHMxMDNfc21wX2RlZmNvbmZpZwo+ID4+Pgo+ID4+PiBJdCdzIHByb2JhYmx5IGR1ZSB0byBh
IGJyb2tlbiBjb25maWd1cmF0aW9uIGZvciB0aGUgYXJjIHRvb2xjaGFpbi4KPiA+Pgo+ID4+IEFs
ZXhleSwgZG8gaGF2ZSBhbnkgaW5zaWdodD8KPiA+Cj4gPiBJIHRoaW5rIEkgZG8gaGF2ZSBzb21l
IGJ1dCBmaXJzdCBJJ2QgbGlrZSB0byBnZXQgaXQgcmVwcm9kdWNlZCBteXNlbGYuCj4gPiBJIGp1
c3QgYnVpbHQgdjUuNiB3aXRoIGhlbHAgb2YgYm90aCBHQ0MgOC4zLjEtICYgOS4zLjEtYmFzZWQg
dG9vbGNoYWlucwo+ID4gYW5kIGRpZG4ndCBzZWUgYSBzaW5nbGUgd2FybmluZy4gU28gSSBndWVz
cyBJIHdhcyBkb2luZyBzb21ldGhpbmcgd3JvbmcuCj4gPgo+ID4gRldJVwo+ID4KPiA+IDEuIE15
IEdDQyA4LjMuMSB0b29sY2hhaW4gd2FzIGV4YWN0bHkgdGhpczoKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9mb3NzLWZvci1zeW5vcHN5cy1kd2MtYXJjLXByb2Nlc3NvcnMvdG9vbGNoYWluL3JlbGVh
c2VzL2Rvd25sb2FkL2FyYy0yMDE5LjA5LXJlbGVhc2UvYXJjX2dudV8yMDE5LjA5X3ByZWJ1aWx0
X3VjbGliY19sZV9hcmNoc19saW51eF9pbnN0YWxsLnRhci5nego+ID4KPiA+IDIuIExpbnV4IGtl
cm5lbCBpcyB2YW5pbGxhIHY1LjYuMAo+ID4KPiA+IDMuIENvbmZpZ3VyZWQgYW5kIGJ1aWx0IGFz
IHNpbXBsZSBhczoKPiA+ICAgIG1ha2UgYXhzMTAzX3NtcF9kZWZjb25maWcgJiYgbWFrZQo+Cj4g
SXQgc2VlbXMgdGhlIGJ1aWxkIHNlcnZpY2UgaXMgdXNpbmcgYSBhcmMgdG9vbGNoYWluIGJ1aWx0
IGluIDIwMTYgOi0pCj4KPiAjIDwgL29wdC9jcm9zcy9raXNza2IvYnItYXJjbGUtaHMzOC1mdWxs
LTIwMTYuMDgtNjEzLWdlOThiNGRkL2Jpbi9hcmMtbGludXgtZ2NjCj4KPiBDYWxsIGl0IE11cnBo
eSdzIGxhdywgc2FtZSB5ZWFyIGEgbGl0dGxlIGxhdGVyIEknZCBmaXhlZCB0aGUgc2FtZSBpc3N1
ZSBpbiBnY2MgWzFdCj4KPiBbMV0gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LXNucHMtYXJjLzIwMTYtT2N0b2Jlci8wMDE2NjEuaHRtbAo+Cj4gQEd1ZW50ZXIgY291
bGQgeW91IHBsZWFzZSBjb25zaWRlciB1cGRhdGluZyB0aGUgQVJDIHRvb2xzLiBGV0lXIHlvdSBj
YW4gYnVpbGQKPiBzdHVmZiBvZmYgdXBzdHJlYW0gZ2NjL2JpbnV0aWxzIHVzaW5nIGJ1aWxkIHN5
c3RlbSBvZiB5b3VyIGNob2ljZS4KClRoaXMgaXMgbm90IEfDvG50ZXIncyB0b29sY2hhaW4sIGJ1
dCBNaWNoYWVsJ3MuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK

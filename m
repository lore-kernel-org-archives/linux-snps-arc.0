Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007DCCA476
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Oct 2025 04:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yyfo3P0cpQlmAIv1YQPmNF5UsSnCWXPC1JkLPE5yJw=; b=rKPckB+kXWLLeu
	xmEsiLnU74Ijw4GSMDC7fuXMIJvEwttHD5aqweXN7Zmo8bHIyjj+rgMGrZS5BkW9fhTPHUdfnRXge
	mPgAdCBPIczsP7GBPXodeS3xTYiQ4gw0VgHF3s7tXHmm++N/AODHfAAHWWWJwdDUZ+I3V8hSW8Cey
	1toLZgy1HN+vKiMj1DLB7x2HVK4W16MokiGqqlX54syM0kQRHpZLZz/nHJ6VhT+Gskjp2kTl2aotY
	zad+cB2jM3N83ImqT/OlB80Bkyik8sR7gneYrcNou7BtUMKvifBQUPIzkks5wKBOjNV4RP39lz9w/
	Yk5dnk5zMFsQt04ZjOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75Cb-00000007gKO-3ZHE;
	Fri, 10 Oct 2025 04:58:01 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75CY-00000007gIO-3fvM
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Oct 2025 04:58:00 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1693677d50.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760072278; x=1760677078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=byZ6t6wrDWSM3IddaYudPoR6XYlS7rynO3IjgiQPfI2Ml35UyMwNN53dYO102kEBt9
         o6/WD7QMEip9m8poYQsQL/UPW3lnIaf5cfUJa4ET61KFoYrOKqPwiffDvhnzCkSXcLss
         iq+5EM1cXwqvyIsuzbKxPyj6QLqX00yE0YGBqDzAtuWc9Rz10N3BKLQwlxH+U4/Y7OqF
         jOK0+z7HS5oIKUQ+jyFw1NW6eQLbhWBbQ+g8DMB7NzieN1x7xuOwvbe1QGKRRq9WTRrk
         iWpXNqv0vlUHRXEl+/1iuOMv/jMaXN2PiDVXkt1kgubaVjxf1YERjzHdbNofm9AiCjFu
         mmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760072278; x=1760677078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=Te8xuF+ugsuJZsU46twOP1DZid39WKf/AekKoiivCG/KvgKf9tWn3J6RiUiGLflwCY
         TOnJcB83wA/mHaTifDURUQOvzvaocFl5JVOfZYYLu2l/44x/EQKZE6+2Bsz5npp1JCAK
         v4hLhfI5mFqm/ArJcJy7h4K6X5D9xbnyJ/vh3TCrD+0urBl2Sxax2KO+tsVy17gknj9l
         d8PYEHXfAJZG6sbACfnZo8vf4DwI7DgfbIygrpInRs+oDcZZFhYERvQ8BQc8m+FkDHOl
         vQubUqegKdu7zpAYnjR+jpln/Uv9n15y4PyHF4Og4VuibaLRNGwj18F3JCtDPNKUcGEy
         jVFg==
X-Forwarded-Encrypted: i=1; AJvYcCX+l1uyecI0TZXcQFI1fjuWZ2oe31hnQi4M+10C2WPlszoTCNvmuVccE+8Ag9DipoVorAmh7Jxj8g201ShjAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+o7+WWLD5ZjUG4tg8Jd4VX2ofRlmfvruINef1cpg0meP4EVkg
	Li79VOxKTTXt7J3YpYFRVwzLmDWTpdmPaIkbM7cqKAKCztR5p1a4uLW5Zpa0SPpbzCOcyNwrcSj
	LY5G2ubEtPTWgqaNHnPkO2I47PXxc2Qo=
X-Gm-Gg: ASbGncuf9NQXzcYTXRNFzzglruaiz4Mcx9eZvJJEbD7wNnUAeSqwg897bOeY+tUqQbW
	MqTpYgBj4JcI0bElqbAqtq1fipbeaBNM0v+Q+1Df0tLVA1Ja1CIycUeDuHlDPYGUoUkrFCl6sWq
	dwuiBy94MncS0YghrDCm9sm562CBMgrFhXsiZkwAagi3HVsQIbuLxlcQQCdqHHYh2kMKLfrcT2e
	WbPOONAkqBjxuQC1eLIFj6MeQ==
X-Google-Smtp-Source: AGHT+IHqDciv7GAPYfMGdKr9Fwuo5GT168N8GcrpsJ5KozP5HqYqg/LDALxuogvzJXgNCm6zrA+DoCqu7lr8uhQrVc0=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr7466309d50.51.1760072277565; Thu, 09 Oct 2025
 21:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
 <20250925131055.3933381-1-nschichan@freebox.fr>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:57:21 +0300
X-Gm-Features: AS18NWAQwCKadWHXCZjVUBNaD3TaKIilJiJAQzSbvGFaYuFuE8UDpW1_H3riB-k
Message-ID: <CAPnZJGBPyONjJoM6cskxysDnN4pxWuWJCK5A6TgikR2xHsrN5Q@mail.gmail.com>
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_215758_919355_458365D6 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgNDoxMuKAr1BNIDxuc2NoaWNoYW5AZnJlZWJveC5mcj4g
d3JvdGU6Cj4gLSBkcm9wIHByb21wdF9yYW1kaXNrIGFuZCByYW1kaXNrX3N0YXJ0IGtlcm5lbCBw
YXJhbWV0ZXJzCj4gLSBkcm9wIGNvbXByZXNzaW9uIHN1cHBvcnQKPiAtIGRyb3AgaW1hZ2UgYXV0
b2RldGVjdGlvbiwgdGhlIHdob2xlIC9pbml0cmQuaW1hZ2UgY29udGVudCBpcyBub3cKPiAgIGNv
cGllZCBpbnRvIC9kZXYvcmFtMAo+IC0gcmVtb3ZlIHJkX2xvYWRfZGlzaygpIHdoaWNoIGRvZXNu
J3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlLgoKSSB3ZWxjb21lIGFueSBpbml0cmQgc2ltcGxp
ZmljYXRpb24hCgo+IEhvcGVmdWxseSBteSBlbWFpbCBjb25maWcgaXMgbm93IGJldHRlciBhbmQg
cmVhY2hlcyBnbWFpbCB1c2Vycwo+IGNvcnJlY3RseS4KClllcywgSSBnb3QgdGhpcyBlbWFpbC4K
Ci0tCkFza2FyIFNhZmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==

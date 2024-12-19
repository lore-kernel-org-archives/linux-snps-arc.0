Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95E1E7718B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9z30wC4sw2T6Lmoqrcpi7L0AZjXDllSVh4a/7HF+q4=; b=TAG/UdCijvppQP
	sTdcYX5KPy6FMOUMQNKKOP7QAJNFmEGGP1Fpldk6Xa5b3CweBpXNzbm++4CgJKLk6WSxU/o4++77r
	hZNbTLCbikyjilnk97JGu4OPYHB16v35Q6r5puswtUUcz9C5TlUYwg256TrVPjZUISejM4n845HKh
	5f1lic8HJIDDkEj9+9Hf+n/0mXoacxDdnAFltuigB3dKGT4gcM36pr3x3eG6K57kLy8BmXnPhdaqR
	U8VQe1l0KmYdMx+zaRd4I2rk/zGlCaNHdcGxMDMxNzWc1YBz5RNtUJ5hA2pU6w0+AV0N4DniIjtnU
	6s1FGiUHzo618X6gQoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6NZ-00000000cI0-2Qqo;
	Thu, 19 Dec 2024 02:35:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6NX-00000000cFQ-1x86
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2167141dfa1so2840785ad.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575706; x=1735180506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yZ75uwrgzXS/KAS9XiI4pfcH/Aa7U+Upt9QqSiD0i8=;
        b=RnX+kMKULQ3C3Ce9IP/49uxDracTi8TA+3FmGwnaHLLL5ShwAIYoBitkivtepWiihQ
         Q7X9pQel/iCyC7P+/dPD1gKRs8Dtuh11qAxVGpYaia8YVJ15WwA7F0GDVxLvU8fhbtgn
         elcYrq327sJRWC/HJ/HDX3hip9RdEoPA11DEni3v09w2Lmu2iFF/OLdl1kEzXHkF6sev
         T4hGjsK/HRDM3/QUaAQj9469s5PjvJ4mRqOwCJ93FqYi8puXYU08xCaWXcFZVkWONxX9
         JqeVpQAaAObjLE8paadVTJxY7nJaki+n2HiH+M4JNGtxGJuCmFzHgaxnlF7p1W0qFc8Q
         8u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575706; x=1735180506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yZ75uwrgzXS/KAS9XiI4pfcH/Aa7U+Upt9QqSiD0i8=;
        b=OZ4URTj43eVgBHXT376Lz9BitnqdCAhUlaKpbKw9TzZLdSvoKyTuRa0ur8a5IlMZh+
         SutCp1YZyLuxLE0QoxPAyXhkhHQTRLTNMx9ivVM+vAisgG2OVZ0+tK67tpYdwiCmqUR6
         0MJjEOQsvgF9IKs2GeOrdYdDJ1xDFbkMIGQZNMjPDUHwNucmUSvr5j3e+YqRqOvNMyFS
         i5juywl7QGeC7pdsOtngaW0hb1HywGEEkWXYybhkZI1PsGgyo2G7H8233r2fPa5aYT0y
         A4AJEyoO1ka/FugZWiSjX+CLsIBKz9Nd+exrJ1DJY1Eh7nhCLSkTz2NK7+TWv35/o6Sq
         dZzw==
X-Forwarded-Encrypted: i=1; AJvYcCXPEgp3T99idmL6yTIBs1oRopE3vQsCSFH28NdHc8K4irfJymDw3eVlWTt3Eh76mtmyFRzNbHxK/YcpMGPPWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgo0rFqNZySKcDRxjSPqYIO6qTlbSiwSjTWx3dL8c+dVjbTcbh
	19fi1uKJLAbokI+fhQKhDnx/p1RCc/WqK788hZWgvxLe2l6vkPXtW1QBQHRfjp0=
X-Gm-Gg: ASbGncvwkcOGgmCtupCwcxgcZD1NmE3LJB872dUXo3R1sxMmzlwLLzM9jq031f6Vukj
	0Wh659W4FwJHcPEtzHG/rSxMzdgvPm0TOYQMDl6SGLwS1GW15mJsWfmXfVIaSWxZYgPZsOfKb3g
	VuedKCXc/FVcNXlUdmUh1Hsysm2ChyLjgtLHG9RmoqAbspN5yZb8esS+oDYTvcDrDFRR0toQziK
	gygM7O+cxEzqqRbNLGgeRa1qfocwYnGWtz5GnSm2r8nXQAXiqc4IplKvM01a7ZJmWHrH4rHF8IN
	LZUFdzU=
X-Google-Smtp-Source: AGHT+IHDUXmWYVlYvXYhHIsD36N49JfOorXAToNFZUciCwG5nEYfG9fZ9g2sYrKUGUIeEzsd5pUGJQ==
X-Received: by 2002:a17:902:f689:b0:215:2d2c:dd0c with SMTP id d9443c01a7336-219da5e3b97mr23433885ad.14.1734575706180;
        Wed, 18 Dec 2024 18:35:06 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:05 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org,
	pmladek@suse.com,
	kvalo@kernel.org,
	bp@alien8.de,
	andriy.shevchenko@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	ocfs2-devel@lists.linux.dev,
	Yafang Shao <laoar.shao@gmail.com>,
	Serge Hallyn <serge@hallyn.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 1/5] kernel: Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:48 +0800
Message-Id: <20241219023452.69907-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183507_506890_2FCFD05E 
X-CRM114-Status: GOOD (  13.39  )
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

U2luY2UgdGFzay0+Y29tbSBpcyBndWFyYW50ZWVkIHRvIGJlIE5VTC10ZXJtaW5hdGVkLCB3ZSBj
YW4gcHJpbnQgaXQKZGlyZWN0bHkgd2l0aG91dCB0aGUgbmVlZCB0byBjb3B5IGl0IGludG8gYSBz
ZXBhcmF0ZSBidWZmZXIuIFRoaXMKc2ltcGxpZmllcyB0aGUgY29kZSBhbmQgYXZvaWRzIHVubmVj
ZXNzYXJ5IG9wZXJhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBZYWZhbmcgU2hhbyA8bGFvYXIuc2hh
b0BnbWFpbC5jb20+CkNjOiBTZXJnZSBIYWxseW4gPHNlcmdlQGhhbGx5bi5jb20+CkNjOiBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0By
ZWRoYXQuY29tPgpDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzog
RGFycmVuIEhhcnQgPGR2aGFydEBpbmZyYWRlYWQub3JnPgpDYzogRGF2aWRsb2hyIEJ1ZXNvIDxk
YXZlQHN0Z29sYWJzLm5ldD4KQ2M6ICJBbmRyw6kgQWxtZWlkYSIgPGFuZHJlYWxtZWlkQGlnYWxp
YS5jb20+Ci0tLQoga2VybmVsL2NhcGFiaWxpdHkuYyAgICAgfCA4ICsrLS0tLS0tCiBrZXJuZWwv
ZnV0ZXgvd2FpdHdha2UuYyB8IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvY2FwYWJpbGl0eS5jIGIva2Vy
bmVsL2NhcGFiaWxpdHkuYwppbmRleCBkYWM0ZGY3N2UzNzYuLmUwODlkMjYyOGMyOSAxMDA2NDQK
LS0tIGEva2VybmVsL2NhcGFiaWxpdHkuYworKysgYi9rZXJuZWwvY2FwYWJpbGl0eS5jCkBAIC0z
OCwxMCArMzgsOCBAQCBfX3NldHVwKCJub19maWxlX2NhcHMiLCBmaWxlX2NhcHNfZGlzYWJsZSk7
CiAKIHN0YXRpYyB2b2lkIHdhcm5fbGVnYWN5X2NhcGFiaWxpdHlfdXNlKHZvaWQpCiB7Ci0JY2hh
ciBuYW1lW3NpemVvZihjdXJyZW50LT5jb21tKV07Ci0KIAlwcl9pbmZvX29uY2UoIndhcm5pbmc6
IGAlcycgdXNlcyAzMi1iaXQgY2FwYWJpbGl0aWVzIChsZWdhY3kgc3VwcG9ydCBpbiB1c2UpXG4i
LAotCQkgICAgIGdldF90YXNrX2NvbW0obmFtZSwgY3VycmVudCkpOworCQkgICAgIGN1cnJlbnQt
PmNvbW0pOwogfQogCiAvKgpAQCAtNjIsMTAgKzYwLDggQEAgc3RhdGljIHZvaWQgd2Fybl9sZWdh
Y3lfY2FwYWJpbGl0eV91c2Uodm9pZCkKIAogc3RhdGljIHZvaWQgd2Fybl9kZXByZWNhdGVkX3Yy
KHZvaWQpCiB7Ci0JY2hhciBuYW1lW3NpemVvZihjdXJyZW50LT5jb21tKV07Ci0KIAlwcl9pbmZv
X29uY2UoIndhcm5pbmc6IGAlcycgdXNlcyBkZXByZWNhdGVkIHYyIGNhcGFiaWxpdGllcyBpbiBh
IHdheSB0aGF0IG1heSBiZSBpbnNlY3VyZVxuIiwKLQkJICAgICBnZXRfdGFza19jb21tKG5hbWUs
IGN1cnJlbnQpKTsKKwkJICAgICBjdXJyZW50LT5jb21tKTsKIH0KIAogLyoKZGlmZiAtLWdpdCBh
L2tlcm5lbC9mdXRleC93YWl0d2FrZS5jIGIva2VybmVsL2Z1dGV4L3dhaXR3YWtlLmMKaW5kZXgg
M2ExMDM3NWQ5NTIxLi5lYjg2YTdhZGUwNmEgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9mdXRleC93YWl0
d2FrZS5jCisrKyBiL2tlcm5lbC9mdXRleC93YWl0d2FrZS5jCkBAIC0yMTAsMTMgKzIxMCwxMiBA
QCBzdGF0aWMgaW50IGZ1dGV4X2F0b21pY19vcF9pbnVzZXIodW5zaWduZWQgaW50IGVuY29kZWRf
b3AsIHUzMiBfX3VzZXIgKnVhZGRyKQogCiAJaWYgKGVuY29kZWRfb3AgJiAoRlVURVhfT1BfT1BB
UkdfU0hJRlQgPDwgMjgpKSB7CiAJCWlmIChvcGFyZyA8IDAgfHwgb3BhcmcgPiAzMSkgewotCQkJ
Y2hhciBjb21tW3NpemVvZihjdXJyZW50LT5jb21tKV07CiAJCQkvKgogCQkJICoga2lsbCB0aGlz
IHByaW50IGFuZCByZXR1cm4gLUVJTlZBTCB3aGVuIHVzZXJzcGFjZQogCQkJICogaXMgc2FuZSBh
Z2FpbgogCQkJICovCiAJCQlwcl9pbmZvX3JhdGVsaW1pdGVkKCJmdXRleF93YWtlX29wOiAlcyB0
cmllcyB0byBzaGlmdCBvcCBieSAlZDsgZml4IHRoaXMgcHJvZ3JhbVxuIiwKLQkJCQkJZ2V0X3Rh
c2tfY29tbShjb21tLCBjdXJyZW50KSwgb3BhcmcpOworCQkJCQkgICAgY3VycmVudC0+Y29tbSwg
b3BhcmcpOwogCQkJb3BhcmcgJj0gMzE7CiAJCX0KIAkJb3BhcmcgPSAxIDw8IG9wYXJnOwotLSAK
Mi40My41CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=

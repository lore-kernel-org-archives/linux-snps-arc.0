Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85244C43461
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0821561284
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0821561284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aG3bSHfcIC6fxR6FspPEd0Kjn4rJJ29TBd8Ha3l21aE=; b=LHzVHr4ZQ8Q9w+4Y5e7ywOIxV
	8xM1jUMVhex4OKDQyEDiS6HkxyUwadWTwWO/dTZfet6ECN3shzEwu7jLMr2EW063OdpB9hvioxN3g
	iZTf6Z4Cd3jGVo/TFHMr0+OWlUbgueZLHSIQ5M5FvX9qygRTsZO9q+6zFvtVJ0wf2A5nSvc/32Iik
	eySAUFcbtR1aabypKpUv854/trLrGe0zvsKwb+DTD4lFSYNNq1Ab5ytiEXfrvL0r/u3US7I23KRw1
	WEGOYm0Z1d6UCRCf5ZuKI8WO5nVrHnDzFQCtEG15MGjFOJxzbPvnEZDX6kw28Ec8OFZ0P14LzFeu2
	6NCLhvmGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHU-00HPiT-FH; Mon, 05 Apr 2021 14:32:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHM-00HPek-OH
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so7659278wmy.5
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er4qANtgKvlPdPBqn0fMmfl5lq/j09+opELRIuQIrcI=;
 b=bO+JOMR9bTwo2Ud4OJC2BvmS3SVl+CPcpsRqBYC7OsFQsE66IcXGO+ZmuoYIif+TEd
 +DsATSozVZtlRUpr8wmHqVNaP6We3cnz54DOqz4q158HIovEhOPQXZLp9xTtpRcuPNbJ
 mnKQj+Gi0skcffE4sEbzTNA8F8OEe1HjpbEakHEuHc/TWNWu+QZdPX/oJ0eXDilhLD6t
 KkCooeeTIIiNnO3TFZ8h9ZWxWom1CPMMtdYCFRM0Kr0D2UCmz21RI2Mc9etkLtkAY5U2
 MrMrljDWT/Gxa9ui0N/or7U6H/rddbXIalw0UBZMcgUPGqIP0CGe3PJRAHigsOLQdUDE
 YRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=er4qANtgKvlPdPBqn0fMmfl5lq/j09+opELRIuQIrcI=;
 b=SX12JJ6xR1WCxVbb+TS+tSlG33ZtRyocq7oz5MOsWmEvWQUEqm49+Aue5Ec03YJv+A
 HNCfbvnO66zKHeeLu8X0IuTE6XtJWuc5rth8bYMi3z8qdfTQauqot55+7lOfPgbNdqHz
 b9iHAEfk1SI1dy6b7IDydSW4o8/EQoUWbiEFNQgt//pdjr7kxDR7IHJHM1SKuigOV+Gz
 mXmqjouDX4HsVQCU3im+kY8GjaSR8N786NEL7NwHNNIuUoe9pc76bEpsPznviq+kJXjx
 rj2FCyQ6DPzaxkhczwMRSaqnyBdsejZ+W+kVQIv0qCQ0SfWUXI7iHq9o+K7cPi4n/JCc
 Jp/g==
X-Gm-Message-State: AOAM5305fM5CwbRHzRzZxL4r/Pr0A8tlUP3weI3VKPyirjgCQ2dSV5tH
 mf68Avl5UOD7RGpa6io1LSA=
X-Google-Smtp-Source: ABdhPJwm4yJT+N++Gcn2c1pBVG5i7pxrWLCZx34E1tT9N0ktHF6Ducg1sEmXdhbKgpVN65tjhZS5tg==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr25510253wmq.96.1617633156388; 
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 25/27] arcv3: gdbstub changes and new XML files
Date: Mon,  5 Apr 2021 15:31:36 +0100
Message-Id: <20210405143138.17016-26-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153237_433384_DB4C6E57 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 gdb-xml/arc-core-v3.xml       |  45 +++++++++
 gdb-xml/arc64-aux-minimal.xml |  32 ++++++
 gdb-xml/arc64-aux-other.xml   | 177 ++++++++++++++++++++++++++++++++++
 target/arc/gdbstub.c          |  23 +++++
 target/arc/gdbstub.h          |  10 ++
 5 files changed, 287 insertions(+)
 create mode 100644 gdb-xml/arc-core-v3.xml
 create mode 100644 gdb-xml/arc64-aux-minimal.xml
 create mode 100644 gdb-xml/arc64-aux-other.xml

diff --git a/gdb-xml/arc-core-v3.xml b/gdb-xml/arc-core-v3.xml
new file mode 100644
index 0000000000..fdca31b4c3
--- /dev/null
+++ b/gdb-xml/arc-core-v3.xml
@@ -0,0 +1,45 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.core">
+  <reg name="r0"       bitsize="64" regnum="0"                  />
+  <reg name="r1"       bitsize="64" regnum="1"                  />
+  <reg name="r2"       bitsize="64" regnum="2"                  />
+  <reg name="r3"       bitsize="64" regnum="3"                  />
+  <reg name="r4"       bitsize="64" regnum="4"                  />
+  <reg name="r5"       bitsize="64" regnum="5"                  />
+  <reg name="r6"       bitsize="64" regnum="6"                  />
+  <reg name="r7"       bitsize="64" regnum="7"                  />
+  <reg name="r8"       bitsize="64" regnum="8"                  />
+  <reg name="r9"       bitsize="64" regnum="9"                  />
+  <reg name="r10"      bitsize="64" regnum="10"                 />
+  <reg name="r11"      bitsize="64" regnum="11"                 />
+  <reg name="r12"      bitsize="64" regnum="12"                 />
+  <reg name="r13"      bitsize="64" regnum="13"                 />
+  <reg name="r14"      bitsize="64" regnum="14"                 />
+  <reg name="r15"      bitsize="64" regnum="15"                 />
+  <reg name="r16"      bitsize="64" regnum="16"                 />
+  <reg name="r17"      bitsize="64" regnum="17"                 />
+  <reg name="r18"      bitsize="64" regnum="18"                 />
+  <reg name="r19"      bitsize="64" regnum="19"                 />
+  <reg name="r20"      bitsize="64" regnum="20"                 />
+  <reg name="r21"      bitsize="64" regnum="21"                 />
+  <reg name="r22"      bitsize="64" regnum="22"                 />
+  <reg name="r23"      bitsize="64" regnum="23"                 />
+  <reg name="r24"      bitsize="64" regnum="24"                 />
+  <reg name="r25"      bitsize="64" regnum="25"                 />
+  <reg name="gp"       bitsize="64" regnum="26"                 />
+  <reg name="fp"       bitsize="64" regnum="27"                 />
+  <reg name="sp"       bitsize="64" regnum="28"                 />
+  <reg name="ilink"    bitsize="64" regnum="29"                 />
+  <reg name="r30"      bitsize="64" regnum="30"                 />
+  <reg name="blink"    bitsize="64" regnum="31"                 />
+  <reg name="accl"     bitsize="64" regnum="32"                 />
+  <reg name="acch"     bitsize="64" regnum="33"                 />
+  <reg name="lp_count" bitsize="64" regnum="34"                 />
+  <reg name="pcl"      bitsize="64" regnum="35"                 />
+</feature>
diff --git a/gdb-xml/arc64-aux-minimal.xml b/gdb-xml/arc64-aux-minimal.xml
new file mode 100644
index 0000000000..56c3f2f698
--- /dev/null
+++ b/gdb-xml/arc64-aux-minimal.xml
@@ -0,0 +1,32 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.aux-minimal">
+  <flags id="status32_type" size="8">
+      <field name="H"   start="0"  end="0"/>
+      <field name="E"   start="1"  end="4"/>
+      <field name="AE"  start="5"  end="5"/>
+      <field name="DE"  start="6"  end="6"/>
+      <field name="U"   start="7"  end="7"/>
+      <field name="V"   start="8"  end="8"/>
+      <field name="C"   start="9"  end="9"/>
+      <field name="N"   start="10" end="10"/>
+      <field name="Z"   start="11" end="11"/>
+      <field name="L"   start="12" end="12"/>
+      <field name="DZ"  start="13" end="13"/>
+      <field name="SC"  start="14" end="14"/>
+      <field name="ES"  start="15" end="15"/>
+      <field name="RB"  start="16" end="18"/>
+      <field name="AD"  start="19" end="19"/>
+      <field name="US"  start="20" end="20"/>
+      <field name="IE"  start="31" end="31"/>
+  </flags>
+  <reg name="pc"       bitsize="64" regnum="36" type="code_ptr"      group="general"/>
+  <reg name="lp_start" bitsize="64" regnum="37" type="code_ptr"      group="general"/>
+  <reg name="lp_end"   bitsize="64" regnum="38" type="code_ptr"      group="general"/>
+  <reg name="status32" bitsize="64" regnum="39" type="status32_type" group="general"/>
+</feature>
diff --git a/gdb-xml/arc64-aux-other.xml b/gdb-xml/arc64-aux-other.xml
new file mode 100644
index 0000000000..75a120b894
--- /dev/null
+++ b/gdb-xml/arc64-aux-other.xml
@@ -0,0 +1,177 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.aux-other">
+  <flags id="timer_build_type" size="8">
+    <field name="version" start="0"  end="7"/>
+    <field name="t0"      start="8"  end="8"/>
+    <field name="t1"      start="9"  end="9"/>
+    <field name="rtc"     start="10" end="10"/>
+    <field name="p0"      start="16" end="19"/>
+    <field name="p1"      start="20" end="23"/>
+  </flags>
+  <flags id="irq_build_type" size="8">
+    <field name="version" start="0"  end="7"/>
+    <field name="IRQs"    start="8"  end="15"/>
+    <field name="exts"    start="16" end="23"/>
+    <field name="p"       start="24" end="27"/>
+    <field name="f"       start="28" end="28"/>
+  </flags>
+  <flags id="vecbase_build_type" size="8">
+    <field name="version" start="2"  end="9"/>
+    <field name="addr"    start="10" end="31"/>
+  </flags>
+  <flags id="isa_config_type" size="8">
+    <field name="version"   start="0"  end="7"/>
+    <field name="va_size"   start="8"  end="11"/>
+    <field name="pa_size"   start="16" end="19"/>
+    <field name="b"         start="20" end="20"/>
+    <field name="a"         start="21" end="22"/>
+    <field name="n"         start="23" end="23"/>
+    <field name="m"         start="24" end="25"/>
+    <field name="c"         start="26" end="27"/>
+    <field name="d"         start="28" end="29"/>
+  </flags>
+  <flags id="timer_ctrl_type" size="8">
+    <field name="ie" start="0" end="0"/>
+    <field name="nh" start="1" end="1"/>
+    <field name="w"  start="2" end="2"/>
+    <field name="ip" start="3" end="3"/>
+    <field name="pd" start="4" end="4"/>
+  </flags>
+  <struct id="mmu_ctrl_type" size="4">
+    <field name="en"  start="0" end="0"/>
+    <field name="ku"  start="1" end="1"/>
+    <field name="wx"  start="2" end="2"/>
+    <field name="tce" start="3" end="3"/>
+  </struct>
+  <struct id="tlbindex_type" size="4">
+    <field name="index" start="0"  end="15"/>
+    <field name="rc"    start="28" end="30"/>
+    <field name="e"     start="31" end="31"/>
+  </struct>
+  <struct id="tlbcmd_type" size="4">
+    <field name="cmd" start="0" end="5"/>
+  </struct>
+  <flags id="erstatus_type" size="8">
+    <field name="e"  start="1"  end="4" />
+    <field name="ae" start="5"  end="5" />
+    <field name="de" start="6"  end="6" />
+    <field name="u"  start="7"  end="7" />
+    <field name="v"  start="8"  end="8" />
+    <field name="c"  start="9"  end="9" />
+    <field name="n"  start="10" end="10"/>
+    <field name="z"  start="11" end="11"/>
+    <field name="l"  start="12" end="12"/>
+    <field name="dz" start="13" end="13"/>
+    <field name="sc" start="14" end="14"/>
+    <field name="es" start="15" end="15"/>
+    <field name="rb" start="16" end="18"/>
+    <field name="ad" start="19" end="19"/>
+    <field name="us" start="20" end="20"/>
+    <field name="ie" start="31" end="31"/>
+  </flags>
+  <flags id="ecr_type" size="8">
+    <field name="parameter"    start="0"  end="7" />
+    <field name="causecode"    start="8"  end="15"/>
+    <field name="vectornumber" start="16" end="23"/>
+    <field name="u"            start="30" end="30"/>
+    <field name="p"            start="31" end="31"/>
+  </flags>
+  <flags id="irq_ctrl_type" size="8">
+    <field name="nr" start="0"  end="4"/>
+    <field name="b"  start="9"  end="9"/>
+    <field name="l"  start="10" end="10"/>
+    <field name="u"  start="11" end="11"/>
+    <field name="lp" start="13" end="13"/>
+  </flags>
+  <flags id="irq_act_type" size="8">
+    <field name="active" start="0" end="15"/>
+    <field name="u" start="31" end="31"/>
+  </flags>
+  <flags id="irq_status_type" size="8">
+    <field name="p"  start="0"  end="3"/>
+    <field name="e"  start="4"  end="4"/>
+    <field name="t"  start="5"  end="5"/>
+    <field name="ip" start="31" end="31"/>
+  </flags>
+  <flags id="mpu_build_type" size="8">
+    <field name="version" start="0" end="7"/>
+    <field name="regions" start="8" end="15"/>
+  </flags>
+  <flags id="mpuen_type" size="8">
+    <field name="ue" start="3"  end="3"/>
+    <field name="uw" start="4"  end="4"/>
+    <field name="ur" start="5"  end="5"/>
+    <field name="ke" start="6"  end="6"/>
+    <field name="kw" start="7"  end="7"/>
+    <field name="kr" start="8"  end="8"/>
+    <field name="en" start="30" end="30"/>
+  </flags>
+  <flags id="mpuecr_type" size="8">
+    <field name="mr"      start="0"  end="7"/>
+    <field name="vt"      start="8"  end="9"/>
+    <field name="ec_code" start="16" end="31"/>
+  </flags>
+  <flags id="mpurdb_type" size="8">
+    <field name="v"         start="0" end="0"/>
+    <field name="base_addr" start="5" end="31"/>
+  </flags>
+  <flags id="mpurdp_type" size="8">
+    <field name="size_lower" start="0"  end="1"/>
+    <field name="ue"         start="3"  end="3"/>
+    <field name="uw"         start="4"  end="4"/>
+    <field name="ur"         start="5"  end="5"/>
+    <field name="ke"         start="6"  end="6"/>
+    <field name="kw"         start="7"  end="7"/>
+    <field name="kr"         start="8"  end="8"/>
+    <field name="size_upper" start="9"  end="11"/>
+  </flags>
+  <struct id="mmu_rtp_type" size="8">
+    <field name="addr"   start="0"  end="47" type="code_ptr"/>
+    <field name="ASID"   start="48" end="63" type="code_ptr"/>
+  </struct>
+  <!-- build registers -->
+  <reg name="timer_build"   bitsize="64" regnum="40" type="timer_build_type"   group=""/>
+  <reg name="irq_build"     bitsize="64" regnum="41" type="irq_build_type"     group=""/>
+  <reg name="vecbase_build" bitsize="64" regnum="42" type="vecbase_build_type" group=""/>
+  <reg name="isa_config"    bitsize="64" regnum="43" type="isa_config_type"    group=""/>
+  <!-- timer registers -->
+  <reg name="timer_count0" bitsize="64" regnum="44"                        group="general"/>
+  <reg name="timer_ctrl0"  bitsize="64" regnum="45" type="timer_ctrl_type" group="general"/>
+  <reg name="timer_limit0" bitsize="64" regnum="46"                        group="general"/>
+  <reg name="timer_count1" bitsize="64" regnum="47"                        group="general"/>
+  <reg name="timer_ctrl1"  bitsize="64" regnum="48" type="timer_ctrl_type" group="general"/>
+  <reg name="timer_limit1" bitsize="64" regnum="49"                        group="general"/>
+  <!-- exception registers -->
+  <reg name="erstatus" bitsize="32" regnum="50" type="erstatus_type" group="general"/>
+  <reg name="erbta"    bitsize="64" regnum="51" type="code_ptr"      group="general"/>
+  <reg name="ecr"      bitsize="32" regnum="52" type="ecr_type"      group="general"/>
+  <reg name="eret"     bitsize="64" regnum="53" type="code_ptr"      group="general"/>
+  <reg name="efa"      bitsize="64" regnum="54" type="uint64"        group="general"/>
+  <!-- irq registers -->
+  <reg name="icause"               bitsize="64" regnum="55"  type="uint8"           group="general"/>
+  <reg name="aux_irq_ctrl"         bitsize="64" regnum="56"  type="irq_ctrl_type"   group="general"/>
+  <reg name="aux_irq_act"          bitsize="64" regnum="57"  type="irq_act_type"    group="general"/>
+  <reg name="irq_priority_pending" bitsize="64" regnum="58"  type="uint16"          group="general"/>
+  <reg name="aux_irq_hint"         bitsize="64" regnum="59"  type="uint8"           group="general"/>
+  <reg name="irq_select"           bitsize="64" regnum="60"  type="uint8"           group="general"/>
+  <reg name="irq_enable"           bitsize="64" regnum="61"  type="bool"            group="general"/>
+  <reg name="irq_trigger"          bitsize="64" regnum="62"  type="bool"            group="general"/>
+  <reg name="irq_status"           bitsize="64" regnum="63"  type="irq_status_type" group="general"/>
+  <reg name="irq_pulse_cancel"     bitsize="64" regnum="64"  type="bool"            group="general"/>
+  <reg name="irq_pending"          bitsize="64" regnum="65"  type="bool"            group="general"/>
+  <reg name="irq_priority"         bitsize="64" regnum="66"  type="uint8"           group="general"/>
+  <!-- miscellaneous -->
+  <reg name="bta" bitsize="64" regnum="67" type="code_ptr" group="general"/>
+  <!-- mmuv6 -->
+  <reg name="mmu_ctrl" bitsize="64" regnum="68" type="mmu_ctrl_type" group="general"/>
+  <reg name="mmu_rtp0" bitsize="64" regnum="69" type="mmu_rtp_type"  group="general"/>
+  <reg name="mmu_rtp1" bitsize="64" regnum="70" type="mmu_rtp_type"  group="general"/>
+  <reg name="tlbindex" bitsize="64" regnum="71" type="tlbindex_type" group="general"/>
+  <reg name="tlbcmd"   bitsize="64" regnum="72" type="tlbcmd_type"   group="general"/>
+</feature>
diff --git a/target/arc/gdbstub.c b/target/arc/gdbstub.c
index a09cdb3f45..84e31b02cc 100644
--- a/target/arc/gdbstub.c
+++ b/target/arc/gdbstub.c
@@ -30,7 +30,13 @@
 #define REG_ADDR(reg, processor_type) \
     arc_aux_reg_address_for((reg), (processor_type))
 
+#ifdef TARGET_ARCV2
 #define GDB_GET_REG gdb_get_reg32
+#elif TARGET_ARCV3
+#define GDB_GET_REG gdb_get_reg64
+#else
+    #error No target is selected.
+#endif
 
 int arc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
@@ -272,6 +278,18 @@ arc_aux_other_gdb_get_reg(CPUARCState *env, GByteArray *mem_buf, int regnum)
     case GDB_AUX_OTHER_REG_BTA:
         regval = helper_lr(env, REG_ADDR(AUX_ID_bta, cpu->family));
         break;
+#ifdef TARGET_ARCV3
+    /* MMUv6 */
+    case GDB_AUX_OTHER_REG_MMU_CTRL:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_ctrl, cpu->family));
+        break;
+    case GDB_AUX_OTHER_REG_RTP0:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_rtp0, cpu->family));
+        break;
+    case GDB_AUX_OTHER_REG_RTP1:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_rtp1, cpu->family));
+        break;
+#endif
     default:
         assert(!"Unsupported other auxiliary register is being read.");
     }
@@ -395,8 +413,13 @@ arc_aux_other_gdb_set_reg(CPUARCState *env, uint8_t *mem_buf, int regnum)
     return 4;
 }
 
+#ifdef TARGET_ARCV2
 #define GDB_TARGET_MINIMAL_XML "arc-v2-aux.xml"
 #define GDB_TARGET_AUX_XML     "arc-v2-other.xml"
+#else
+#define GDB_TARGET_MINIMAL_XML "arc64-aux-minimal.xml"
+#define GDB_TARGET_AUX_XML     "arc64-aux-other.xml"
+#endif
 
 void arc_cpu_register_gdb_regs_for_features(ARCCPU *cpu)
 {
diff --git a/target/arc/gdbstub.h b/target/arc/gdbstub.h
index 2ced52ee57..ff00c592e1 100644
--- a/target/arc/gdbstub.h
+++ b/target/arc/gdbstub.h
@@ -20,7 +20,11 @@
 #ifndef ARC_GDBSTUB_H
 #define ARC_GDBSTUB_H
 
+#ifdef TARGET_ARCV2
 #define GDB_TARGET_STRING "arc:ARCv2"
+#else
+#define GDB_TARGET_STRING "arc:ARCv3_64"
+#endif
 
 enum gdb_regs {
     GDB_REG_0 = 0,
@@ -147,6 +151,12 @@ enum gdb_aux_other_regs {
     GDB_AUX_OTHER_REG_TLBPD1,           /* page descriptor 1 */
     GDB_AUX_OTHER_REG_TLB_INDEX,        /* tlb index         */
     GDB_AUX_OTHER_REG_TLB_CMD,          /* tlb command       */
+#ifdef TARGET_ARCV3
+    /* mmuv6 */
+    GDB_AUX_OTHER_REG_MMU_CTRL,         /* mmuv6 control */
+    GDB_AUX_OTHER_REG_RTP0,             /* region 0 ptr  */
+    GDB_AUX_OTHER_REG_RTP1,             /* region 1 ptr  */
+#endif
 
     GDB_AUX_OTHER_REG_LAST
 };
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

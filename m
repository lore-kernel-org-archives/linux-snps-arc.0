Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9343DC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 23:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9D02072D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 23:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UFaT8ywq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IV+I/Bt8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OwX6oLFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9D02072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5jjEZ2XdkywVocyjqvNfMqokm0dxFdpe5ns5nLuL7E=; b=UFaT8ywq7Hv3gT
	qy9AW/8HapBl5sPa6Zm8VgRSwTB2Vq/rrgwXvKTAa+LBHA2l+BM8oKn8ywje2DOKZYuo+yhRBfR7X
	rreusmy3F5Wi3tkB9cxk6f1lgv8ieUc3+IGRrmeKcfMEOwyLFQzMWXufC/5Wbk+SAH8UdOCdnNqLs
	4/C5oURHuYAzg7Y9zQ5Nhum57+xt7VRDgnWMwuNfks6x2XFRDzuCUkhMvYl5LRjohWU1oLyD0LuSl
	0IOXXlKahNbOeJoG/LI5f/x2lQdUlIEO+Eb9fjhZJQdBpqoqv3HsM6NclTlWccOCFn0R0ff8ghMMS
	Q4BcA2H3GQCywQpUP4Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeonC-0004QY-IS; Fri, 29 May 2020 23:52:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeon9-0004Pp-MY
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 23:52:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 59E02C042D;
 Fri, 29 May 2020 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590796317; bh=jYuYv+ldPyJ/8nF95tO575EWXyHVIcSEjRJPsipFg28=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IV+I/Bt8MISo7/9fVsXu7R9zTXNSlrUuNLqW1Rjo3DEyWPhnWqRejv+autzAqWcCV
 oVbM3p4BovuLRucoKfmPdyyo3AQs6X7ysRcF7SQQ/iFCUNKhgYna+AKG+o9pidJFhI
 RwI9ibWXEYZ3eI0A/svOKXT0LpwoWyKNqsektP9Ajbla0K879/UB54QQQ+2cFrCNMQ
 i8wrNH5Av55DkL6+KJji2blqOkcVvkaKqCO/757+qPCEMdYnAvqxPDHrgYVjkvL68H
 Bghc3LOgAHrdhfIDFSsD0vmg121Kvclw8NptnqxEm8kiyUHkyewt3NTSO8MF1mlS6n
 2PuZls6jK3tCQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B6649A008A;
 Fri, 29 May 2020 23:51:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 16:50:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 16:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuBFskptF2CkmAf7AC/YS1cPbKSMWBe4rkaxaaMub37UUabyPUQButLPKsGTMY8DFlakwhx6W64dKaW6OGSUOXbykvNp3VCqVPAU/Ytj4ABb+0IElmbEeGdJVMNJ99RB2Yfo8T4ZlHFgM01SwGlUcKWAu2YQwO1ArMqcd7dfpOOeDa6iPP8Vx0JSiHoNSIIHnAzf+67P/OfesRefkzY4JnPo2gzkin4BBiUVMWS09DP3xVMDzHc1b+UZsOQuwiO0E4elM3/GaxV9piEf2Xrw7tGMY8RGZ6XusvsQ4ZH+GCFCJ3y6ItFqCi3LOf1x8/oXQJQFfSES0Tk5BXanlaDMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYuYv+ldPyJ/8nF95tO575EWXyHVIcSEjRJPsipFg28=;
 b=nsIGhZycUEPRMXSqjWcIZQYaUwQLL8fSb0wuKTlAwtBqWFaYQ7GZN4e/+7R2WpZ3XbxDFc8OfrefRHYCJnEi44+72dCPxKNnH2nSPM6otUJkNfNEq8wIgUaLymegJDz6sKEtEesJfuky2xVK1fIhdQy8U/ou4qqfto6ACjsR5OKbzOPfcgGTthg26zFoXBCZ2UBcE/HqCN9PB53Z/lCQet7Oqtvak2spm+0C9jbmNmnP675H4i36XBW5KJcGSC1YejoY4a8cQwJbjKbseS0gJE0jiRuqhey+GxshZWBoURqnWWGE+KMmcJ/yqhW5jCpBTZYuFsV4RQ82W2m+I5XlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYuYv+ldPyJ/8nF95tO575EWXyHVIcSEjRJPsipFg28=;
 b=OwX6oLFwtSRfXvx9z5TfIUxTKYyZqM3rMFUetmBC8ZjGz0X9Mt5npkgkyyqo3brOqz3tcU/BCyzK1DJQFQzqVGtbu8DxIwGrgiilvtenDgU+pO3S45vzFnOXIIwwv0K4deaBuBlup8RxXXumgxl2LDH/YRzoBdb/katjCfd253M=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3080.namprd12.prod.outlook.com (2603:10b6:a03:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 23:50:31 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 23:50:31 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Topic: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Index: AQHWNcNXJXMgGASM2kSQaj0x3NFlH6i/pXMAgAAW5AA=
Date: Fri, 29 May 2020 23:50:30 +0000
Message-ID: <5b06914d-acb3-4404-4ff2-93bb7a04f8f5@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
 <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
In-Reply-To: <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e39e3969-5354-4c26-74bc-08d8042b126a
x-ms-traffictypediagnostic: BYAPR12MB3080:
x-microsoft-antispam-prvs: <BYAPR12MB30808CEA7F953A7FAA3FE19FB68F0@BYAPR12MB3080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RvrHkW8xGxlfA6gj1HOpBukYIKTCuRsbd+E/RbJZ3pP+aj0nnH9ANjnN+zouVxPKP7s1ecliODvRGnohdQoEtAKh2JFX0cayvhDVXMXO4LZszc0EZzMq7IyEfgneKBwT5Yd6inpX/PdFx89zlAFOrmZoACesopBBfmc25gr29TZ1IO0vjqsd4Z0GRpucGm1B+q4DuhztjKfJ+mNoB/4/DXx9eG89NuMzoft8KAj4ggzJ4L1e/woNMUePND26PkpYUO6J9LvLA4XkUWAnRhNemsYHg5B+ecFLLf4KAsox7WI4Inrtg4qI12MzszJiTyTj38pG7Kl4WVsSds2X2moHFU8Iam/TDElW1m3ySTn2FbQ3sfZCa9qLVA+yJ13uz7mk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(39860400002)(366004)(396003)(86362001)(71200400001)(8676002)(8936002)(316002)(4326008)(66446008)(64756008)(36756003)(6486002)(66556008)(66946007)(66476007)(76116006)(6506007)(6512007)(2906002)(5660300002)(478600001)(31686004)(186003)(83380400001)(2616005)(31696002)(53546011)(26005)(110136005)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uRhtdI0o5+V1maTnviJFnfswYmJ1SzcN6T6zfCjtdIIQYAeXpiCShHrK9N3/yTfxR+uWLt7FSjzMd+/MEdOAlPRn9na5vma3qtHlIwLhVhfZa1Qumd2ibjWFTRve2SBY/u8HB4YWSRXyJlzCQ44/GaXhCMz5P7LuYBDq/5UvCC8v7/mdMz4PzuTuHnI4usmhDdoW6GwHWZdBL0Dq4Rsi8ROYETzJBsM1qpG7qSTAB3h6jNFasTTlFA08QTd68rSRaS5/VTustEFtP26Z5HKkuLMfd8cVhB2VsKB4DANP3VpZzFs7boohzS9hrXLWHJksps8GAcc+p+Tf/QtYl6k2ai/SfRdvqOvKksbuWjZA+VeYBjkgBrlB8dPl66RsTIhM2WQAOPYmtfgxJhrxUfMuD5CQp4/6+C4GWPr/ciPoqiVc3BgiiKMIUGq1WK2kGSu7Z3i1Rj10zwA9Nr9MFt8J311S721ZqBK1PwVAt7mx/uovDBYQEsTRWzk73gep/39X
x-ms-exchange-transport-forked: True
Content-ID: <1215EE385FD13A48961C243310C855E5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e39e3969-5354-4c26-74bc-08d8042b126a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 23:50:30.9927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9Cn5iIfBY+aYGdpwYLqxzhM2MIB97cPr2uSgALq746SCqwdMEwnoIVqy5OYWx8vjIKlkPgvelWhlNMbW/qjeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_165159_830213_67C9AAFC 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/29/20 3:28 PM, Vineet Gupta via Libc-alpha wrote:
>>> +/* Macros for accessing the hardware control word.  */
>>> +#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
>>> +#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
>>> +
>>> +/*  Macros for accessing the hardware status word.
>>> +    FWE bit is special as it controls if actual status bits could be wrritten
>>> +    explicitly (other than FPU instructions). We handle it here to keep the
>>> +    callers agnostic of it:
>>> +      - clear it out when reporting status bits
>>> +      - always set it when changing status bits.  */
>>> +#  define _FPU_GETS(cw)				\
>>> +    __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
>>> +                      "bclr %0, %0, 31	\r\n" 	\
>>> +                      : "=r" (cw))
>>> +
>>> +#  define _FPU_SETS(cw)				\
>>> +    do {					\
>>> +      unsigned int __tmp = 0x80000000 | (cw);	\
>>> +      __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
>>> +                        : : "r" (__tmp));	\
>>> +    } while (0)
>>> +
>> Although this code follow other architectures, I think it woudl be better
>> to move forward a macro that emulates function calls and use proper
>> static inline function instead for _FPU_* (as for get-rounding-mode.h).
> OK. do you have a preference for names, existing upper case names OK ?

Something like below ?

+# define _FPU_FPSR_FWE		0x80000000
+
-#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
-#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
+static inline unsigned int arc_fpu_getcw(void)
+{
+  unsigned int cw;
+  __asm__ volatile ("lr %0, [0x300]" : "=r" (cw));
+  return cw;
+}
+
+static inline void arc_fpu_setcw(unsigned int cw)
+{
+  __asm__ volatile ("sr %0, [0x300]" : : "r" (cw));
+}

 /*  Macros for accessing the hardware status word.
     FWE bit is special as it controls if actual status bits could be wrritten
     explicitly (other than FPU instructions). We handle it here to keep the
     callers agnostic of it:
       - clear it out when reporting status bits
-      - always set it when changing status bits.  */
-#  define _FPU_GETS(cw)				\
-    __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
-                      "bclr %0, %0, 31	\r\n" 	\
-                      : "=r" (cw))
-
-#  define _FPU_SETS(cw)				\
-    do {					\
-      unsigned int __tmp = 0x80000000 | (cw);	\
-      __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
-                        : : "r" (__tmp));	\
-    } while (0)
+      - set it when intending to change status bits.  */
+static inline unsigned int arc_fpu_getsw(void)
+{
+  unsigned int sw;
+  __asm__ volatile ("lr %0, [0x301]" : "=r" (sw));
+  sw &= ~_FPU_FPSR_FWE;
+  return sw;
+}
+
+static inline void arc_fpu_setsw(unsigned int sw)
+{
+  sw |= _FPU_FPSR_FWE;
+  __asm__ volatile ("sr %0, [0x301]" : : "r" (sw));
+}
+
+# define _FPU_GETCW arc_fpu_getcw
+# define _FPU_SETCW arc_fpu_setcw
+# define _FPU_GETS  arc_fpu_getsw
+# define _FPU_SETS  arc_fpu_setsw

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
